FROM fstehle/rpi-node:4

RUN [ "cross-build-start" ]

RUN apt-get -q update && apt-get install -qy \
    build-essential \
    git \
    libavahi-compat-libdnssd-dev \
    libasound2-dev \
    python

RUN npm install -g --unsafe-perm homebridge
RUN npm install -g --unsafe-perm homebridge-wemo
RUN npm install -g --unsafe-perm homebridge-homematic

RUN mkdir -p /var/run/dbus

ADD docker-run.sh /usr/bin/docker-run

RUN [ "cross-build-end" ]

EXPOSE 5353 51826

CMD ["/usr/bin/docker-run"]
