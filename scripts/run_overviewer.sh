#!/bin/bash

mkdir -p $HOME/overviewer/renders

# Temporarily stop server
sudo immortalctl stop minecraft
overviewer.py --config $HOME/overviewer/ovconfig
sudo immortalctl start minecraft