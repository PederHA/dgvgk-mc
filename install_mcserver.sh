#!/bin/bash
# Run this script in the directory where the various server directories should reside

apt-get update && \
apt-get install -y wget openjdk-11-jre-headless unzip && \
wget -O "ngrok.zip" https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip && \
unzip ngrok.zip && \
rm ngrok.zip && \
mkdir /root/.ngrok2 && \
mv ngrok.yml /root/.ngrok2/ngrok.yml && \
mv ngrok /root/.ngrok2/ngrok && \
echo "authtoken: $NGROK_AUTHTOKEN" >> /root/.ngrok2/ngrok.yml && \
wget -O "paper.jar" https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/457/downloads/paper-1.16.5-457.jar && \
echo "eula=true" > eula.txt
