#!/bin/sh
while true
do
  if [ -f /run/recordwin.pid ]
  then
    while [ -f /run/recordwin.wid ]; do sleep 1; done
    bash -c 'kill -n 2 -`cat /run/recordwin.pid`'
    rm /run/recordwin.pid
  fi
  sleep 1
done
