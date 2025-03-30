FROM ubuntu:20.04

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update && apt-get -y install git \
    make \
    software-properties-common \
    build-essential \
    libsdl1.2-dev \
    libsdl-image1.2-dev \
    python2 \
    python-is-python2 \
    xvfb \
    x11vnc\
    xdotool \
    wget \
    tar \
    supervisor \
    net-tools \
    fluxbox \
    libsdl2-image-2.0-0 \
    gnupg2 && \
    apt-get -y full-upgrade && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /root/

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./roms .

ENV DISPLAY :0

RUN add-apt-repository ppa:libretro/stable -y && apt-get update && apt-get install retroarch -y

RUN git clone https://github.com/libretro/FBNeo.git && \
        cd FBNeo/src/burner/libretro && make

RUN retroarch --help

RUN cd FBNeo/src/burner/libretro && cp fbneo_libretro.so /root/.config/retroarch/cores/

COPY ./retroarch.cfg /root/.config/retroarch/retroarch.cfg

RUN wget -O - https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C /root/ && mv /root/noVNC-1.1.0 /root/novnc && ln -s /root/novnc/vnc_lite.html /root/novnc/index.html && \
    wget -O - https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | tar -xzv -C /root/ && mv /root/websockify-0.9.0 /root/novnc/utils/websockify

EXPOSE 8080

CMD ["/usr/bin/supervisord"]