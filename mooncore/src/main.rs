/*
* File name: main.rs
* Author: Katherine
* Date created: 2025-12-26 18:57:54
// Date modified: 2025-12-26 19:21:27
* ===============
*/

pub mod cli;

use std::{
    fs::File,
    io::{self, BufRead},
    process::Command,
};

use anyhow::anyhow;
use clap::Parser;

use crate::cli::Args;

enum InternetKind {
    WiFi(f32),
    Lan,
}

fn get_internet_device() -> anyhow::Result<String> {
    let output = Command::new("sh")
        .args([
            "-c",
            "ip route get '2800:3f0:4005:41b::200e' | grep -Po '(?<= dev ).+?(?= (src|proto))'",
        ])
        .output()?;

    Ok(String::from_utf8(output.stdout)?)
}

fn parse_signal_strength() -> anyhow::Result<i32> {
    let file = File::open("/proc/net/wireless")?;
    let lines = io::BufReader::new(file).lines();
    if let Some(line) = lines.last() {
        let quality = line?
            .split(' ')
            .nth(5)
            .ok_or(io::Error::new(
                io::ErrorKind::UnexpectedEof,
                "/proc/net/wireless has wrong format, expected third element in last column",
            ))?
            .strip_suffix('.')
            .ok_or(io::Error::new(
                io::ErrorKind::UnexpectedEof,
                "/proc/net/wireless has wrong format, signal strength should end in '.'",
            ))?
            .parse()?;
        return Ok(quality);
    }
    Err(anyhow!(io::Error::new(
        io::ErrorKind::UnexpectedEof,
        "/proc/net/wireless has wrong format, couldn't read /proc/net/wireless",
    )))
}

fn main() -> anyhow::Result<()> {
    let cli = Args::parse();

    match cli.action {
        cli::Action::Daemon => println!("Daemonizing!"),
        cli::Action::Connect => println!("Connecting!"),
        cli::Action::Run => println!("Running!"),
    }

    println!("Signal strength: {}", parse_signal_strength()?);
    println!("Device: {}", get_internet_device()?);
    Ok(())
}
