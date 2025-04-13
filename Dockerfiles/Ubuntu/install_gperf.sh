#! /bin/bash

sudo apt install libgoogle-perftools-dev google-perftools
sudo apt install automake autoconf libtool

cd /usr/local/
git clone --recursive https://github.com/gperftools/gperftools.git
cd gperftools
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make check  # optional step, google profiler's self-test
sudo make install