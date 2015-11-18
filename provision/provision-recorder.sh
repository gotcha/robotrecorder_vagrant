#!/bin/sh
pip install vnc2flv
mkdir --parents /usr/share/selenium
wget -O /usr/share/selenium/selenium-server-standalone.jar http://selenium-release.storage.googleapis.com/2.48/selenium-server-standalone-2.48.2.jar
cp /tmp/provision/rec-window.py /usr/local/bin/rec-window.py
chmod +x /usr/local/bin/rec-window.py
echo "loop snd-aloop index=0 pcm_substreams=1" > /etc/modules
cp /tmp/provision/asound.conf /etc/asound.conf
cp /tmp/provision/rec-start.sh /usr/local/bin/rec-start.sh
cp /tmp/provision/startall.sh /usr/local/bin/startall.sh
chmod +x /usr/local/bin/rec-start.sh
cp /tmp/provision/rec-stop.sh /usr/local/bin/rec-stop.sh
chmod +x /usr/local/bin/rec-stop.sh
cp /tmp/provision/xvfb.conf /etc/supervisor/conf.d/xvfb.conf
SUPERVISORD_CONF="/etc/supervisor/supervisord.conf"
if ! grep -c "nodaemon=true" $SUPERVISORD_CONF; then
  sed -i -e 's/\[supervisord\]/[supervisord]\nnodaemon=true/' $SUPERVISORD_CONF
fi
cp /tmp/provision/selenium-server.conf /etc/supervisor/conf.d/selenium-server.conf
cp /tmp/provision/rec-start.conf /etc/supervisor/conf.d/rec-start.conf
cp /tmp/provision/rec-stop.conf /etc/supervisor/conf.d/rec-stop.conf
cp /tmp/provision/rec-window.conf /etc/supervisor/conf.d/rec-window.conf
update-java-alternatives -s java-1.7.0-openjdk-amd64
