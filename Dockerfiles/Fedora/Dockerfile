FROM fedora:33

# Comment out the tsflags, for (dnf) installing packages with documents
# and set to auto select fastested repo mirror
# and update dnf packages
RUN sed -ie '/tsflags=nodocs/s/^/# /g' /etc/dnf/dnf.conf && \
    echo "fastestmirror=1" >> /etc/dnf/dnf.conf && \
    dnf update -y

# [install] Linux utilities
RUN dnf install -y \
    man man-pages \
    sudo \
    util-linux-user hostname \
    crontabs \
    vim tmux zsh autojump-zsh \
    less \
    htop glances\
    lsof \
    mlocate \
    wget \
    rsync \
    net-tools iputils \
    procps-ng \
    nmap \
    patch \
    openssh-server \
    bzip2 \
    myrepos vcsh \
    ripgrep \
    fzf \
    glibc-all-langpacks

# [install] about network security
RUN dnf install -y \
    strace \
    ltrace

# [install] about developer
RUN dnf install -y \
    make cmake automake autoconf \
    git \
    gcc gcc-c++ clang gdb \
    gperftools \
    cppcheck \
    java \
    golang \
    python \
    python-devel \
    python37 \
    python3-pip \
    python3-devel \
    pylint \
    zlib-devel

RUN dnf debuginfo-install -y glibc libgcc libstdc++

# For building TCmalloc & Google use it :)
RUN dnf copr enable -y vbatts/bazel && \
    dnf install -y bazel3

# [install] others (e.g., dependencies)
RUN dnf install -y \
    ghostscript

# [install - optional] Google Drive cli
# vaughan/drive-google doesn't support older version of Fedora (< 31)
# - [ ] TODO: https://github.com/odeke-em/drive#from-sources
# odeke-em/drive → rclone/rclone
RUN curl https://rclone.org/install.sh | bash

# After install all tools, update man db and clean dnf cache
RUN mandb && dnf clean all && rm -rf /var/cache/dnf

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
RUN chown -R ${CUST_USER}:${CUST_USER} /home/${CUST_USER}/.ssh && chmod 600 /home/${CUST_USER}/.ssh/authorized_keys

# Set the user name to use when running the image
# => because sshd need root permission, so default user must be root
# USER ${CUST_USER}

# Set the working directory for following instructions
WORKDIR /home/${CUST_USER}

# [install] other tools (need pip3, git clone)
# Error: Fedora 32 repo doesn't support docker (2020-07)
ADD install_docker.sh /install_docker.sh
RUN chmod 755 /install_docker.sh && /install_docker.sh

ADD install_c-c++.sh /install_c-c++.sh
RUN chmod 755 /install_c-c++.sh && /install_c-c++.sh

ADD install_python.sh /install_python.sh
RUN chmod 755 /install_python.sh && /install_python.sh

#ADD install_others.sh /install_others.sh
#RUN chmod 755 /install_others.sh && /install_others.sh

# Provide defaults for an executing container
ADD start.sh /
RUN chmod 755 /start.sh
CMD ["/start.sh"]