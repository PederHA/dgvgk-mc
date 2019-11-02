#!/bin/bash
# Run this script in the directory where the various server directories should reside

sudo apt update && \
sudo apt install -y openjdk-8-jre-headless && \
curl -s https://packagecloud.io/install/repositories/immortal/immortal/script.deb.sh | sudo bash && \
sudo apt install -y immortal && \
mkdir -p server && \
cd server && \
curl -o "paper.jar" https://papermc.io/api/v1/paper/1.14.4/225/download && \
echo "eula=true" > eula.txt