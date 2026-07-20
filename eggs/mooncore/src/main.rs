/*
* File name: main.rs
* Author: Katherine
* Date created: 2025-12-26 18:57:54
// Date modified: 2025-12-27 13:43:33
* ===============
*/

pub mod cli;
pub mod internet;

use std::path::Path;
use std::process::exit;

use clap::Parser;
use tokio::io::{self, AsyncBufReadExt, AsyncReadExt, AsyncWriteExt, BufReader};
use tokio::net::{UnixListener, UnixStream};
use tokio::signal;
use tokio::sync::mpsc::{Receiver, channel};

use crate::cli::{Cli, MooncoreCommand};
use crate::internet::{InternetKind, get_internet_kind};

// https://ice.computer/blog/fast-unix-sockets-with-tokio
async fn server(socket_path: String, mut shutdown_receiver: Receiver<()>) -> anyhow::Result<()> {
    let socket_path_buf = Path::new(&socket_path).to_path_buf();
    let listener = UnixListener::bind(socket_path_buf.clone())?;

    // Waits until shutdown signal is sent to delete socket file
    tokio::spawn(async move {
        match shutdown_receiver.recv().await {
            Some(()) => {
                if let Err(e) = tokio::fs::remove_file(socket_path_buf).await {
                    panic!("Failed to remove socket file. ({})", e)
                }
            }
            None => {
                panic!("This should've never happened.");
            }
        }
    });

    // Continuously accepting streams
    while let Ok((mut stream, _)) = listener.accept().await {
        println!("Listening on: {}", socket_path);
        // Reading 1024 bytes per read
        let mut buffer: [u8; 1024] = [0u8; 1024];
        stream.writable().await?;
        tokio::spawn(async move {
            loop {
                match stream.read(&mut buffer).await {
                    Ok(n) => {
                        if n == 0 {
                            break;
                        }
                        println!("Client: {:?}", String::from_utf8_lossy(&buffer[..n]));
                        match stream.try_write(b"Hello World!") {
                            Ok(n) => break,
                            Err(ref e) if e.kind() == io::ErrorKind::WouldBlock => {
                                continue;
                            }
                            Err(e) => return (),
                        }
                        ()
                    }
                    Err(e) => {
                        eprintln!("Error writing to client. ({})", e);
                        break;
                    }
                }
            }
        });
    }

    Ok(())
}

async fn client(socket_path: String, mut shutdown_receiver: Receiver<()>) -> anyhow::Result<()> {
    let mut unixstream = UnixStream::connect(
            Path::new(&socket_path)
        )
        .await
        .expect("Could not connect to the socket path. Ensure that the path is correct and is being listened on.");
    println!("Connected to {}", socket_path);
    // Waits until shutdown signal is sent to delete socket file
    tokio::spawn(async move {
        match shutdown_receiver.recv().await {
            Some(()) => {
                println!("Shutting down the client");
                exit(1);
            }
            None => {
                panic!("This should've never happened.");
            }
        }
    });

    let mut stdout = io::stdout();
    let mut stdin_lines = BufReader::new(io::stdin()).lines();
    loop {
        stdout.write(b"Text: ").await?;
        stdout.flush().await?;

        if let Some(line) = stdin_lines.next_line().await? {
            unixstream.write(line.as_bytes()).await?;
        }
    }
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let cli = Cli::try_parse()?;
    let internet = get_internet_kind()?;

    if let InternetKind::WiFi(quality) = internet {
        println!("Internet: Wifi, Quality: {}", quality);
    } else {
        println!("Internet: Ethernet")
    }

    static SOCKET_PATH: &'static str = "mooncore.sock";
    let (shutdown_sender, shutdown_receiver) = channel(1);

    println!("Command: {:?}", cli);

    tokio::spawn(async move {
        match signal::ctrl_c().await {
            Ok(()) => {
                shutdown_sender.send(()).await.unwrap();
            }
            Err(e) => {
                eprintln!("{}", e)
            }
        }
    });

    if let MooncoreCommand::Daemon { action } = cli.command {
        match action {
            cli::DaemonAction::Start => server(SOCKET_PATH.into(), shutdown_receiver).await?,
            cli::DaemonAction::Stop => {}
        }
    } else {
        client(SOCKET_PATH.into(), shutdown_receiver).await?;
    }

    Ok(())
}
