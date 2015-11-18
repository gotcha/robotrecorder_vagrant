#!/bin/sh
while [ ! -f /recordings/README ]; do sleep 1; done
cd /recordings || exit
while [ ! -f /run/recordwin.wid ]; do sleep 1; done
echo $$ > /run/recordwin.pid
X11VNC="x11vnc -nocursor" ARECORD="arecord -Dloop -r22050 -fS16_LE" recordwin.sh -display :99 -id `cat /run/recordwin.wid`
