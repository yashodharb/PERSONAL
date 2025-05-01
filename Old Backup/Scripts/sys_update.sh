#!/bin/bash
echo "Updating system..."
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y
echo "Cleaning up..."
sudo apt-get autoremove -y && sudo apt-get clean
echo "System updated and cleaned."
clear
