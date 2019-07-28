#!/bin/bash

mkdir /minecraft
cd /minecraft

wget https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar

echo "eula=true" > eula.txt

yum -y install java-1.8.0-openjdk

exec java -Xmx512M -Xms512M -jar server.jar nogui
