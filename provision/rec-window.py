#!/usr/bin/python
import os
import re
import subprocess
import time

iceweasel = re.compile(
    r'\s*(0x\d*)\s"[^"]*":\s\("Navigator" "Iceweasel"\)', re.I + re.M
)


while True:
    p = subprocess.Popen(['xwininfo', '-tree', '-root'],
                         stdout=subprocess.PIPE)
    windows = iceweasel.findall(p.stdout.read())
    if windows:
        with open('/run/recordwin.wid', 'w') as output:
            output.write(windows[0])
    elif os.path.exists('/run/recordwin.wid'):
        os.unlink('/run/recordwin.wid')
    time.sleep(1)
