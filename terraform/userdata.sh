#!/bin/bash

minecraftd_version="beta-v0.3"

# Hogs a bunch of memory and it's not even set up right now
yum erase amazon-ssm-agent –y
yum -y install java-1.8.0-openjdk

# Wrapper for minecraft client
# It also downloads a client for you
cd /srv
wget https://github.com/ChristianFusco/abs/releases/download/${minecraftd_version}/${minecraftd_version}.tar.gz
tar -zxf ${minecraftd_version}.tar.gz && rm ${minecraftd_version}.tar.gz
cd /srv/minecraft-server && sh minecraft-server-install.sh

# Set up minecraft static files
cd /srv/minecraft && echo "eula=true" > eula.txt
aws s3 cp s3://362440755021-minecraft-data/server.properties .

minecraftd start
