FROM fedora:30

# Comment out the tsflags, for (dnf) installing packages with documents
# and set to auto select fastested repo mirror
# and update dnf packages
RUN sed -ie '/tsflags=nodocs/s/^/# /g' /etc/dnf/dnf.conf && \
    echo "fastestmirror=1" >> /etc/dnf/dnf.conf && \
    dnf update -y

# [install] Linux utilities
RUN dnf install -y \
        man \
        man-pages \
        sudo \
        util-linux-user \
        vim \
        zsh \
        autojump-zsh \
        tmux \
        less \
        htop \
        lsof \
        wget \
        rsync \
        net-tools \
        procps-ng \
        nmap \
        patch \
        iputils \
        openssh-server \
        bzip2 \
        myrepos vcsh \
        ripgrep \
        fzf

# [install] about network security
RUN dnf install -y \
        strace \
        ltrace

# [install] about developer
RUN dnf install -y \
        make \
        cmake \
        git \
        gcc \
        gcc-c++ \
	    cppcheck \
        clang \
        gdb \
        cgdb \
        golang \
        python \
        python-devel \
        python37 \
        python3-pip \
        python3-devel \
	    pylint

# [install - optional] Google Drive cli
RUN dnf copr enable -y vaughan/drive-google && \
    dnf install -y drive-google

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

# Set the user name to use when running the image
# => because sshd need root permission, so default user must be root
# USER ${CUST_USER}

# Set the working directory for following instructions
WORKDIR /home/${CUST_USER}

# [install] other tools (need pip3, git clone)
ADD install_others.sh /install_others.sh
RUN chmod 755 /install_others.sh && /install_others.sh

# Provide defaults for an executing container
ADD start.sh /
RUN chmod 755 /start.sh
CMD ["/start.sh"]