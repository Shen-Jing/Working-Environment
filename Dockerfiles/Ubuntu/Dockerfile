FROM ubuntu:20.04

# [install] Linux utilities
RUN apt update -y && 
    apt install -y \
    man-db \
    sudo \
    zsh \
    vim tmux \
    autojump \
    less \
    htop glances\
    lsof \
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

# [install] about developer
RUN apt install -y \
        make cmake \
        git \
        gcc g++ g++-10 \
        clang gdb \
        cppcheck \
        golang \
        python \
        python3.8 \
        python3-pip \
        pylint

# [install - optional] Google Drive cli

# After install all tools, update man db and clean dnf cache
RUN mandb && apt-get autoclean

ENV CUST_USER shenjing
# [system setting] Add user and set account passwd (user_name:passwd)
# and set timezone
# and add user to sudoers
RUN adduser ${CUST_USER} --create-home --shell /usr/bin/zsh --uid 1209 && \
    echo "root:bb8590" | chpasswd && \
    echo "${CUST_USER}:8590" | chpasswd && \
    ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    echo "${CUST_USER}    ALL=(ALL)   ALL" >> /etc/sudoers

# [ssh setting] ssh daemon and no-passwd login 
RUN mkdir -p /var/run/sshd && \
    ssh-keygen -A && \
    mkdir /home/${CUST_USER}/.ssh
ADD authorized_keys /home/${CUST_USER}/.ssh/authorized_keys
RUN chown -R ${CUST_USER}:${CUST_USER} /home/${CUST_USER}/.ssh

# Set the user name to use when running the image
# => because sshd need root permission, so default user must be root
# USER ${CUST_USER}

# Set the working directory for following instructions
WORKDIR /home/${CUST_USER}

# [install] other tools (need pip3, git clone)
ADD install_docker.sh /install_docker.sh
RUN chmod 755 /install_docker.sh && /install_docker.sh
ADD install_others.sh /install_others.sh
RUN chmod 755 /install_others.sh && /install_others.sh

# Provide defaults for an executing container
ADD start.sh /
RUN chmod 755 /start.sh
CMD ["/start.sh"]