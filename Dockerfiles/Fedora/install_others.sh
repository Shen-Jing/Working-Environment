#!/bin/bash
CUST_USER="shenjing"
CUST_HOME="/home/${CUST_USER}"
cd ${CUST_HOME}

# [Other]
# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh && rm get-docker.sh
# And modify permission (lab's docker gid: 4001)
groupmod -g 4001 docker && usermod -aG docker ${CUST_USER}

# [Shell]

# [Python]
pip install ipython
pip3 install ipython jupyter pandas
# pip3 install numpy
python3 -m pip install numpy

# Linter
pip3 install flake8 mypy

# [Network Security]
# python3-pwntools
pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git

# Crypto
#pip3 install pycryptodome

# gdb-pwn
git clone https://github.com/scwuaptx/Pwngdb.git ${CUST_HOME}/Pwngdb
cp ${CUST_HOME}/Pwngdb/.gdbinit ${CUST_HOME}/

# gdb-peda
git clone https://github.com/scwuaptx/peda.git ${CUST_HOME}/peda
echo "source ${CUST_HOME}/peda/peda.py" >> ${CUST_HOME}/.gdbinit
cp ${CUST_HOME}/peda/.inputrc ${CUST_HOME}/

# [Develope]
# Boost
PATH_TO_BOOST="/usr/local"
BOOST_DIR="boost_1_71_0"
cd ${PATH_TO_BOOST}
wget -P ${PATH_TO_BOOST} https://dl.bintray.com/boostorg/release/1.71.0/source/${BOOST_DIR}.tar.bz2
tar -jxf ${BOOST_DIR}.tar.bz2 -C ${PATH_TO_BOOST}
cd ${PATH_TO_BOOST}/${BOOST_DIR}
./bootstrap.sh
./b2 install
rm -f ${PATH_TO_BOOST}/${BOOST_DIR}.tar.bz2

# Google Test
git clone https://github.com/google/googletest.git ~/googletest
cd ~/googletest
# gtest (O) gmock (X)
cmake . -DBUILD_GMOCK=OFF -DBUILD_GTEST=ON
make
make install
# /usr/local/include/gtest
rm -rf ~/googletest

# [Trivial]