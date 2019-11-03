#!/bin/bash

# Temporarily stop server
sudo immortalctl stop minecraft
overviewer.py --config $HOME/dgvgk-mc/overviewer/ovconfig
sudo immortalctl start minecraft