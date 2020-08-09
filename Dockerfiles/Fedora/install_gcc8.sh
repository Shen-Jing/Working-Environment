#!/bin/bash

# [Develope]
# gcc/g++ 8.4.0 support for Biovoltron cmake build
GCC_VER="gcc-8.4.0"
dnf install -y libmpc-devel mpfr-devel gmp-devel
# For error: gnu/stubs-32.h: No such file or directory
dnf install -y glibc-devel.i686 glibc-devel.x86_64
cd /
wget http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/${GCC_VER}/${GCC_VER}.tar.gz && tar zxvf ${GCC_VER}.tar.gz
cd ${GCC_VER} && contrib/download_prerequisites

mkdir ../gcc-build
cd ../gcc-build
../${GCC_VER}/configure -v \
--enable-bootstrap \
--enable-languages=c,c++,objc,obj-c++,fortran,go,lto \
--prefix=/usr/local \
--mandir=/usr/share/man --infodir=/usr/share/info \
--with-bugurl=http://bugzilla.redhat.com/bugzilla \
--enable-shared --enable-threads=posix --enable-checking=release --enable-multilib --with-system-zlib \
--enable-__cxa_atexit --disable-libunwind-exceptions \
--enable-gnu-unique-object --enable-linker-build-id --with-gcc-major-version-only \
--with-linker-hash-style=gnu --enable-plugin --enable-initfini-array --with-isl --enable-libmpx --enable-offload-targets=nvptx-none \
--without-cuda-driver --enable-gnu-indirect-function --with-tune=generic --with-arch_32=i686 --build=x86_64-redhat-linux

make -j 24
make install