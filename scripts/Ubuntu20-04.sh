#! /bin/bash

apt update -y
apt upgrade -y

# Linux utilities
sudo apt install -y \
    vim tmux zsh autojump \
    htop glances\
    lsof \
    mlocate \
    wget \
    rsync \
    net-tools \
    iproute2 iputils-ping \
    nmap \
    patch \
    openssh-server \
    bzip2 \
    myrepos vcsh \
    ripgrep \
    fzf

#  network security
sudo apt install -y \
    strace \
    ltrace

#  about developer
sudo apt install -y \
    make cmake automake autoconf \
    git \
    gcc g++-10 clang gdb cgdb \
    cppcheck \
    golang \
    python \
    python3.8 \
    python3-pip \
    pylint

# For building TCmalloc & Google use it :)


#  others (e.g., dependencies)
