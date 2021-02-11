#!/bin/bash
# Run this script in the directory where the various server directories should reside

apt-get update && \
apt-get install -y wget openjdk-11-jre-headless python3.8 python3.8-distutils unzip && \
wget -O "get-pip.py" https://bootstrap.pypa.io/get-pip.py  && \
python3.8 get-pip.py && \
python3.8 -m pip install supervisor && \
mkdir -p ~/.ngrok2 server logs && \
cd server && \
wget -O "paper.jar" https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/457/downloads/paper-1.16.5-457.jar && \
echo "eula=true" > eula.txt

# cd server/spongeforge && \
# wget -O spongeforge.jar https://repo.spongepowered.org/maven/org/spongepowered/spongeforge/1.12.2-2838-7.3.0/spongeforge-1.12.2-2838-7.3.0.jar
# echo "eula=true" > eula.txt