#!/bin/bash

mkdir /minecraft
cd /minecraft

wget https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar

EULA=$(cat <<-END
#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).\n
#Tue Jul 16 19:33:18 PDT 2019\n
eula=true\n
END
)

echo $EULA > eula.txt

yum -y install java-1.8.0-openjdk

exec java -Xmx512M -Xms512M -jar server.jar nogui
