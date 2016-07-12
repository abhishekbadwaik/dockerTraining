#!/bin/bash

apt-get update
apt-get install -y ssh
sed -i 's/without_password/yes/g'
service ssh restart
apt-get install -y software-properties-common apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-engine

