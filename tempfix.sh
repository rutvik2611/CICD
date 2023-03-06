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


docker run -d \
  --name jenkins-slave \
  --user root \
  -e JENKINS_URL=http://167.71.16.137:8080 \
  -e JENKINS_TUNNEL=a5e4404b153a4fcfd5d65d79e84247c0a6d8edd4261d8547bb1e11edbc0706e814d341c56509dfe9fef4e09b76b9b09a449b9e2502e23a179ffaedf1e654cec0085473c12d398dd89a9c3ca38ac63d9f5039d5ef6d23909684b29dc89a2477a03aaf6a4b16bb150fb0eddc1871c92d6aeb66bfc821d54a7190598a7d5bc3df29root@2fcc084d359 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $HOME/jenkins_slave:/var/jenkins_home \
  -v /usr/bin/docker:/usr/bin/docker \
  -v /usr/bin/docker-compose:/usr/bin/docker-compose \
  jenkins/jnlp-slave \
  -url http://192.168.8.113:8080
