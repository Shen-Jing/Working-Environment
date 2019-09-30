#! /bin/bash

yum -y update
# -[fail2ban]-
yum install -y epel-release fail2ban
systemctl enable fail2ban
systemctl start fail2ban

# -[docker]-
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

# set up the stable repository
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce docker-ce-cli containerd.io

# -[NFS, NIS]-
# nfs-utils includes rpcbind
yum install -y nfs-utils

# -[sshd]-
yum install -y openssh
systemctl enable sshd.service

# -[option]-
yum install -y vim tmux rsync net-tools
