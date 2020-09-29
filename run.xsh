#!/usr/bin/env xonsh

import subprocess, signal
from xonsh.tools import print_color

class Process:
    stop_now = False
    def __init__(self, cmd):
        for s in [signal.SIGINT, signal.SIGTERM]:
            signal.signal(s, self.proc_terminate)

        proc = subprocess.Popen(cmd, shell=True)
        self.proc = proc
        self.pid = proc.pid
        proc.wait()

    def proc_terminate(self, signum, frame):
        print_color(f'CATCH: signum={signum}, stopping the process...')
        self.proc.terminate()
        self.stop_now = True

if __name__ == '__main__':
    echo '[Work before running the app]'

    echo "The app just sleep 2 minutes zZzZzZz..."
    p = Process('sleep 2m')

    echo '[Work after running the app or getting stop signals]'
