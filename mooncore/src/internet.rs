/*
* File name: internet.rs
* Author: Katherine
* Date created: 2025-12-27 12:38:58
// Date modified: 2025-12-27 12:42:04
* ===============
*/

use anyhow::anyhow;
use std::{
    fs::File,
    io::{self, BufRead},
    process::Command,
};

#[derive(Debug)]
pub enum InternetKind {
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

pub fn get_internet_kind() -> anyhow::Result<InternetKind> {
    let device = get_internet_device()?;
    match device {
        _ if device.contains("wlan") => {
            let strength = parse_signal_strength()?;
            let mut float_strength: f32 = strength as f32;
            float_strength /= 70.0;
            Ok(InternetKind::WiFi(float_strength))
        }
        _ if device.contains("eth") => Ok(InternetKind::Lan),
        _ => Err(anyhow!(io::Error::new(
            io::ErrorKind::Unsupported,
            "This network device is unsupported",
        ))),
    }
}
