#!/bin/bash

# Get GLIBC
wget http://ftp.gnu.org/gnu/glibc/glibc-2.32.tar.gz && \
tar zxvf glibc-2.32.tar.gz && rm glibc-2.32.tar.gz

cd glibc-2.32

# Create build directory
mkdir build && cd build

# Build and install
../configure --prefix=/opt/glibc-2.32
make -j "$(nproc)"
sudo make install

# Link libraries
for lib in /opt/glibc-2.32/lib/*; do
    ln -s "$lib" "/usr/$(basename $lib)"
done

echo "Installed GLIBC 2.32"
