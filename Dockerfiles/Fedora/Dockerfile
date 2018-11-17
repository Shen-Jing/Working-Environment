FROM fedora:28

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
        tmux \
        less \
        htop \
        wget \
        net-tools

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
        python \
        python37

# After install all tools, update man db and clean dnf cache
RUN mandb && dnf clean all && rm -rf /var/cache/dnf

ENV CUST_USER shenjing
# [system setting] Add user and set account passwd (user_name:passwd)
# and set timezone
RUN adduser ${CUST_USER} --create-home --shell /usr/bin/zsh && \
    echo "root:bb8590" | chpasswd && \
    echo "${CUST_USER}:8590" | chpasswd && \
    ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime

# Set the user name to use when running the image
USER ${CUST_USER}
# Set the working directory for following instructions
WORKDIR /home/${CUST_USER}

# Provide defaults for an executing container
CMD ["/usr/bin/zsh"]
