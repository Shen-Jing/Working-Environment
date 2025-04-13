#!/bin/bash

# **deprecated**: gdb-pwn & gdb-peda would affect vscode debugger 
# gdb-pwn

# gdb-peda

# [Develope]
PATH_TO_INSTALL="/usr/local"

# Boost
BOOST_VER="1.88.0"
BOOST_DIR="boost_1_88_0"
cd ${PATH_TO_INSTALL}
curl -L -o ${PATH_TO_INSTALL}/${BOOST_DIR}.tar.bz2 https://dl.bintray.com/boostorg/release/${BOOST_VER}/source/${BOOST_DIR}.tar.bz2
tar -jxf ${BOOST_DIR}.tar.bz2 -C ${PATH_TO_INSTALL}
cd ${PATH_TO_INSTALL}/${BOOST_DIR}
./bootstrap.sh
./b2 install
rm -f ${PATH_TO_INSTALL}/${BOOST_DIR}.tar.bz2

# Google Test
cd ${PATH_TO_INSTALL}
git clone https://github.com/google/googletest.git -b v1.16.0
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

# TCMalloc - Bazel
sudo apt install apt-transport-https curl gnupg -y
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt update && sudo apt install bazel
sudo apt update && sudo apt full-upgrade

# TCMalloc
cd ${PATH_TO_INSTALL}
git clone https://github.com/google/tcmalloc.git
cd tcmalloc
bazel test //tcmalloc/...