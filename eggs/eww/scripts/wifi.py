#!/usr/bin/python3

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# ▗▖ ▗▖ ▗▄▖▗▄▄▄▖▗▖ ▗▖▗▖  ▗▖▗▄▄▖    ▗▄▄▄  ▗▄▖▗▄▄▄▖▗▄▄▄▖▗▄▄▄▖▗▖   ▗▄▄▄▖ ▗▄▄▖
# ▐▌▗▞▘▐▌ ▐▌ █  ▐▌ ▐▌ ▝▚▞▘▐▌       ▐▌  █▐▌ ▐▌ █  ▐▌     █  ▐▌   ▐▌   ▐▌
# ▐▛▚▖ ▐▛▀▜▌ █  ▐▛▀▜▌  ▐▌  ▝▀▚▖    ▐▌  █▐▌ ▐▌ █  ▐▛▀▀▘  █  ▐▌   ▐▛▀▀▘ ▝▀▚▖
# ▐▌ ▐▌▐▌ ▐▌ █  ▐▌ ▐▌  ▐▌ ▗▄▄▞▘    ▐▙▄▄▀▝▚▄▞▘ █  ▐▌   ▗▄█▄▖▐▙▄▄▖▐▙▄▄▖▗▄▄▞▘
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#
# Author: Katherine C. (katherine@kaytea.dev)
# Source: http://github.com/KatieUmbra/Dotfiles
# License: MIT
# Description: eww python script that tracks the strength and status of the wifi signal

import subprocess
import threading

wifiStrength = "iwconfig wlan0 | grep -i quality"
icon = ""


def call_repeatedly(interval, func, *args):
    stopped = threading.Event()

    def loop():
        while not stopped.wait(interval):  # the first call is in `interval` secs
            func(*args)

    threading.Thread(target=loop).start()
    return stopped.set


def testStrength():
    global icon
    localIcon = ""

    try:
        subprocess.check_call(["wget", "-q", "--spider", "https://google.com"])
        process = subprocess.run(
            wifiStrength, shell=True, capture_output=True, text=True
        )
        ratio = int(process.stdout[23:25]) / int(process.stdout[26:28])
        ratio *= 100
        ratio = round(ratio)
        if ratio < 25:
            localIcon = "1"
        elif ratio < 50:
            localIcon = "2"
        elif ratio < 75:
            localIcon = "3"
        else:
            localIcon = "4"
    except:
        localIcon = "5"

    if icon != localIcon:
        icon = localIcon
        print(icon, flush=True)


cancel = call_repeatedly(1.0, testStrength)
