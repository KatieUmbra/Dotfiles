/*
* File name: cli.rs
* Author: Katherine
* Date created: 2025-12-26 18:37:26
// Date modified: 2025-12-26 19:28:54
* ===============
*/

use clap::{Parser, ValueEnum};

#[derive(Parser)]
#[command(version, about, long_about = None)]
pub struct Args {
    #[arg(value_enum)]
    pub action: Action,
}

#[derive(Copy, Clone, PartialEq, Eq, PartialOrd, Ord, ValueEnum)]
pub enum Action {
    Daemon,
    Connect,
    Run,
}
