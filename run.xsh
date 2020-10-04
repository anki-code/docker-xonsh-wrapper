#!/usr/bin/env xonsh
# https://github.com/anki-code/docker-xonsh-wrapper

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

    #Example of registering environment variables to convert them to pathlib.Path type
    #
    #env = __xonsh__.env
    #env.register('MY_FILE', 'path', default=p'/volume/my_file.txt')
    #env.register('MY_TARGET_DIR', 'path', default=p'/volume/my_target_dir')
    #
    #if not $MY_TARGET_DIR.exists():
    #    mkdir -p $MY_TARGET_DIR
    #    cp $MY_FILE $MY_TARGET_DIR


    echo "The app just sleep 2 minutes zZzZzZz..."
    p = Process('sleep 2m')


    echo '[Work after running the app or getting stop signals]'
