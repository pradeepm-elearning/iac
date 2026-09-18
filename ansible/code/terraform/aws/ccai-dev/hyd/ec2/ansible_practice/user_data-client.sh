#!/bin/bash
timedatectl set-timezone Asia/Kolkata

# Ensure python3, pip, and venv packages are available
sudo apt update -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update -y
sudo apt install python3 -y

