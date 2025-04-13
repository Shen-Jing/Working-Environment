#! /bin/bash

set -x

sudo apt update -y
sudo apt upgrade -y

# Linux utilities
sudo apt install -y \
    vim tmux zsh autojump \
    htop \
    lsof \
    mlocate \
    wget \
    rsync \
    net-tools \
    iproute2 iputils-ping \
    patch \
    openssh-server \
    bzip2 \
    myrepos vcsh \
    fzf

#  network security
sudo apt install -y \
    strace \
    ltrace

#  about developer
sudo apt install -y \
    make cmake automake autoconf \
    git \
    gcc g++-14 clang gdb cgdb \
    cppcheck \
    golang \
    python3-pip \
    pylint

# For building TCmalloc & Google use it :)


#  others (e.g., dependencies)

# Not apt-installable in 24.04
sudo snap install glances nmap ripgrep