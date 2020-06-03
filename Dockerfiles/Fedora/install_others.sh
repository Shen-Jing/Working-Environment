#!/bin/bash
CUST_USER="shenjing"
CUST_HOME="/home/${CUST_USER}"
cd ${CUST_HOME}

# [Other]

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

# **deprecated**: gdb-pwn & gdb-peda would affect vscode debugger 
# gdb-pwn

# gdb-peda

# [Develope]
# Boost
PATH_TO_BOOST="/usr/local"
BOOST_DIR="boost_1_73_0"
cd ${PATH_TO_BOOST}
#wget -P ${PATH_TO_BOOST} https://dl.bintray.com/boostorg/release/1.73.0/source/${BOOST_DIR}.tar.bz2
curl -L -o ${PATH_TO_BOOST}/${BOOST_DIR}.tar.bz2 https://dl.bintray.com/boostorg/release/1.73.0/source/${BOOST_DIR}.tar.bz2
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