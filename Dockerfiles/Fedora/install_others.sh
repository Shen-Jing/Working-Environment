#!/bin/bash
CUST_USER="shenjing"
CUST_HOME="/home/${CUST_USER}"
cd ${CUST_HOME}

# [Others]
# pip3 install numpy
python3 -m pip install numpy

# [Network Security]
# python3-pwntools
pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git

# Crypto
pip3 install pycryptodome

# [Linter]
pip3 install flake8
pip3 install mypy

# gdb-pwn
git clone https://github.com/scwuaptx/Pwngdb.git ${CUST_HOME}/Pwngdb
cp ${CUST_HOME}/Pwngdb/.gdbinit ${CUST_HOME}/

# gdb-peda
git clone https://github.com/scwuaptx/peda.git ${CUST_HOME}/peda
echo "source ${CUST_HOME}/peda/peda.py" >> ${CUST_HOME}/.gdbinit
cp ${CUST_HOME}/peda/.inputrc ${CUST_HOME}/

# radare 2
git clone https://github.com/radare/radare2.git
cd radare2
# root cannot use install.sh to install, so we change to normal user
su ${CUST_USER}
sys/install.sh
