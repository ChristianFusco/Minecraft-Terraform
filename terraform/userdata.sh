#!/bin/bash

# Hogs a bunch of memory and it's not even set up right now
yum erase amazon-ssm-agent –y

mkdir /minecraft
cd /minecraft

# Probably don't need the && there to get the minecraft latest name
url=$(curl https://www.minecraft.net/en-us/download/server/ | grep minecraft_server | cut -d \" -f2) \
 && url=$(echo $url | cut -d ' ' -f1)

wget $url

echo "eula=true" > eula.txt

yum -y install java-1.8.0-openjdk

exec java -server -Xmx768M -Xms768M \
	-XX:+UseParNewGC \
  	-XX:ParallelGCThreads=2 \
  	-XX:+UseCompressedOops \
  	-XX:+TieredCompilation \
  	-XX:+DoEscapeAnalysis \
  	-jar server.jar nogui &