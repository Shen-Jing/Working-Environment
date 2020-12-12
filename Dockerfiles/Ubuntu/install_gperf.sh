#! /bin/bash

sudo apt install libgoogle-perftools-dev google-perftools
sudo apt install automake autoconf libtool

cd /usr/local/
git clone --recursive https://github.com/gperftools/gperftools.git
cd gperftools
./autogen.sh
./configure
make
make check  # optional step, google profiler's self-test
make install