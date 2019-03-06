#!/bin/bash
CUST_USER="shenjing"
CUST_HOME="/home/${CUST_USER}"
cd ${CUST_HOME}

# [Others]
pip3 install ipython
# pip3 install numpy
python3 -m pip install numpy

# [Linter]
pip3 install flake8
pip3 install mypy

# [Network Security]
# python3-pwntools
pip3 install --upgrade git+https://github.com/arthaud/python3-pwntools.git

# Crypto
pip3 install pycryptodome

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
BOOST_DIR="boost_1_69_0"
wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.bz2
tar -jxf boost_1_69_0.tar.bz2 -C ${PATH_TO_BOOST}
${PATH_TO_BOOST}/${BOOST_DIR}/bootstrap.sh
${PATH_TO_BOOST}/${BOOST_DIR}/b2 install
rm -f boost_1_69_0.tar.bz2

# Google Test
git clone https://github.com/google/googletest.git
cd ./googletest
# gtest (O) gmock (X)
cmake . -DBUILD_GMOCK=OFF -DBUILD_GTEST=ON
make
make install
# /usr/local/include/gtest
rm -rf ../googletest

# [Trivial]
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# And I should run `tmux source ~/.tmux.conf` in tmux
# <prefix> + I to install plugin 
