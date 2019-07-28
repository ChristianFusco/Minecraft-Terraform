#!/bin/bash

mkdir /minecraft
cd /minecraft

# Probably don't need the && there to get the minecraft latest name
url=$(curl https://www.minecraft.net/en-us/download/server/ | grep minecraft_server | cut -d \" -f2) \
 && url=$(echo $url | cut -d ' ' -f1)

wget $url

echo "eula=true" > eula.txt

yum -y install java-1.8.0-openjdk

exec java -Xmx1024M -Xms1024M -jar server.jar nogui &