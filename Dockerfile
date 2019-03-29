# Use an official Ubuntu as a parent image
FROM ubuntu:18.04

LABEL maintainer="lzutao https://github.com/lzutao/docker-compton"

# Set the working directory to /root
WORKDIR /root

ENV LANG="C.UTF-8"

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        ssh git curl asciidoc libxml2-utils \
        ca-certificates \
        gcc clang meson ninja-build \
        xcb-proto libx11-dev \
        libx11-xcb-dev libxext-dev libxcb-damage0-dev libxcb-xfixes0-dev \
        libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev \
        libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev \
        libxcb-xinerama0-dev libxcb1-dev \
        libpixman-1-dev libdbus-1-dev \
        libconfig-dev libxdg-basedir-dev libev-dev libpcre3-dev \
        libgl1-mesa-dev \
        xvfb mesa-utils xserver-xorg-core xauth libgl1-mesa-dri \
        docbook-xml xsltproc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/share/man/?? /usr/share/man/??_* /usr/share/man/??.* \
    && find /usr/share/locale -mindepth 1 -maxdepth 1 ! -name 'en' -exec rm -rf {} +
