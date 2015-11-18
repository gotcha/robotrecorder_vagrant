#!/bin/sh
export DISPLAY=:99
export LANG=en_US.utf8
if [ `lsmod | grep -c snd_aloop` -eq 0 ] ; then
        modprobe snd-aloop index=0 pcm_substreams=1
fi
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
