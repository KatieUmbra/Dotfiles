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
# Description: eww python script that watches a file to check when a volume key is presed to play sounds and show a screen
import os
import subprocess
import sys
from pathlib import Path
from queue import Queue
from threading import Thread

from resettabletimer import ResettableTimer
from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer
from watchdog.observers.api import BaseObserver

message_queue: Queue[bool] = Queue()
abs_path = os.path.abspath(__file__)

print(abs_path)


class ModifyHandler(FileSystemEventHandler):
    def on_modified(self, event):
        message_queue.put(True)


def timer_handler():
    subprocess.run(["eww", "close", "volume"])


def timer_thread():
    delay = 3
    timer = ResettableTimer(delay, timer_handler)
    timer.start()
    while True:
        try:
            message = message_queue.get()
            timer.reset()
            subprocess.run(["eww", "open", "volume"])
            if message == False:
                break
        except KeyboardInterrupt:
            break
    try:
        sys.exit(130)
    except SystemExit:
        sys.exit(130)


def main():
    path = Path(abs_path).parent.joinpath("changes")
    observer: BaseObserver = Observer()
    handler = ModifyHandler()
    observer.schedule(handler, str(path), recursive=True)
    listener_thread = Thread(target=timer_thread)

    observer.start()
    listener_thread.start()

    listener_thread.join()
    observer.stop()
    observer.join()


if __name__ == "__main__":
    main()
