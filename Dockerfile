FROM java:openjdk-7-jre
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y locales
RUN apt-get install -y python python-dev python-pip supervisor
RUN apt-get install -y x11-xkb-utils x11vnc 
RUN apt-get install -y xfonts-100dpi xfonts-75dpi xfonts-cyrillic xfonts-scalable
RUN apt-get install -y kmod java-common
RUN apt-get install -y libgdk-pixbuf2.0-common openjdk-7-jre 
RUN apt-get install -y alsa-utils dos2unix icedtea-7-plugin iceweasel lame
RUN apt-get install -y debconf-utils
RUN echo "keyboard-configuration  keyboard-configuration/variant  select English (US)" | debconf-set-selections
RUN apt-get install -y wget xserver-xorg-core xvfb
COPY provision /tmp/provision
RUN /tmp/provision/provision-apt.sh
RUN /tmp/provision/provision-recorder.sh
CMD ["/usr/local/bin/startall.sh"]
