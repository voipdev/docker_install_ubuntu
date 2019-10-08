#!/bin/bash

# Installation script for docker engine, containerd and docker-compose
# OS requirements: Ubuntu Bionic/Xenial

# remove previous installs
sudo apt-get remove docker docker-engine docker.io

sudo apt-get -y update

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# update package index
sudo apt-get -y update

# install docker engine & containerd
sudo apt-get -y install docker-ce docker-ce-cli containerd.io

# install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# make binary executable
sudo chmod +x /usr/local/bin/docker-compose


