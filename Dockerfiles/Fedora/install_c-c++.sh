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
cd ${PATH_TO_INSTALL}
git clone https://github.com/google/googletest.git -b release-1.10.0
cd googletest        # Main directory of the cloned repository.
mkdir build          # Create a directory to hold the build output.
cd build
cmake ..             # Generate native build scripts for GoogleTest.
make
make install

# pprof
cd ${PATH_TO_INSTALL}
git clone --recursive https://github.com/gperftools/gperftools.git
cd gperftools
./autogen.sh
./configure
make
make check  # optional step, google profiler's self-test
make install

# TCMalloc
cd ${PATH_TO_INSTALL}
git clone https://github.com/google/tcmalloc.git
cd tcmalloc
bazel test //tcmalloc/...