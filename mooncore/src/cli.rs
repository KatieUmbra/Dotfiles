/*
* File name: cli.rs
* Author: Katherine
* Date created: 2025-12-26 18:37:26
// Date modified: 2025-12-27 13:23:26
* ===============
*/

use clap::{Args, Parser, Subcommand, ValueEnum};

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
#[command(propagate_version = true)]
pub struct Cli {
    #[command(subcommand)]
    pub command: MooncoreCommand,
}

#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Subcommand)]
pub enum MooncoreCommand {
    Daemon {
        action: DaemonAction,
    },
    Connect {
        target: ConnectTarget,
    },
    #[command(subcommand)]
    Run(RunScript),
}

#[derive(Copy, Clone, PartialEq, Debug, Eq, PartialOrd, Ord, ValueEnum)]
pub enum DaemonAction {
    Start,
    Stop,
}

#[derive(Copy, Clone, PartialEq, Eq, Debug, PartialOrd, Ord, ValueEnum)]
pub enum ConnectTarget {
    Brightness,
    Bluetooth,
    DateTime,
    Battery,
    Sunset,
    Sound,
    Media,
    Wifi,
    Niri,
    Dnd,
}

#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Subcommand)]
pub enum RunScript {
    #[command(subcommand)]
    Brightness(BrightnessScripts),
    #[command(subcommand)]
    Bluetooth(DefaultScripts),
    #[command(subcommand)]
    Sunset(DefaultScripts),
    #[command(subcommand)]
    Sound(SoundScripts),
    #[command(subcommand)]
    Media(MediaScripts),
    #[command(subcommand)]
    Wifi(SoundScripts),
    Niri(NiriScript),
    #[command(subcommand)]
    Dnd(DefaultScripts),
}

#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Subcommand)]
pub enum BrightnessScripts {
    Increase { amount: u32 },
    Decrease { amount: u32 },
    Set { amount: u32 },
}
#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Subcommand)]
pub enum SoundScripts {
    ToggleMute,
    SetMute { value: bool },
    IncreaseVolume { amount: u32 },
    DecreaseVolume { amount: u32 },
    SetVolume { amount: u32 },
}
#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Subcommand)]
pub enum MediaScripts {
    Next,
    Previous,
    PauseToggle,
    Stop,
    LoopToggle,
    ShuffleToggle,
    SetPosition {
        #[arg(long)]
        position: u32,
    },
}
#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Subcommand)]
pub enum DefaultScripts {
    Enable,
    Disable,
}

#[derive(Copy, Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Args)]
pub struct NiriScript {
    #[arg(long)]
    pub workspace: i32,
    #[arg(long)]
    pub monitor: i32,
}
