#!/bin/bash

# **deprecated**: gdb-pwn & gdb-peda would affect vscode debugger 
# gdb-pwn

# gdb-peda

# [Develope]
PATH_TO_INSTALL="/usr/local"
# Boost
BOOST_VER="1.75.0"
BOOST_DIR="boost_1_75_0"
cd ${PATH_TO_INSTALL}
curl -L -o ${PATH_TO_INSTALL}/${BOOST_DIR}.tar.bz2 https://dl.bintray.com/boostorg/release/${BOOST_VER}/source/${BOOST_DIR}.tar.bz2
tar -jxf ${BOOST_DIR}.tar.bz2 -C ${PATH_TO_INSTALL}
cd ${PATH_TO_INSTALL}/${BOOST_DIR}
./bootstrap.sh
./b2 install
rm -f ${PATH_TO_INSTALL}/${BOOST_DIR}.tar.bz2

# Google Test
git clone https://github.com/google/googletest.git ${PATH_TO_INSTALL}/googletest
cd ${PATH_TO_INSTALL}/googletest
# gtest (O) gmock (X)
cmake . -DBUILD_GMOCK=OFF -DBUILD_GTEST=ON
make
make install
# /usr/local/include/gtest
rm -rf ${PATH_TO_INSTALL}/googletest