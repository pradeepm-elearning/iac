#!/bin/bash

# Define the target user
TARGET_USER="ubuntu"
TARGET_HOME="/home/$TARGET_USER"
SSH_DIR="$TARGET_HOME/.ssh"

timedatectl set-timezone Asia/Kolkata

# Ensure python3, pip, and venv packages are available
sudo apt update -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update -y
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt-get install python3-minimal python3-virtualenv python3-dev build-essential -y
sudo apt install python3.10-venv -y


# Execute the configuration steps as the 'ubuntu' user
sudo -u ubuntu bash << 'EOF'
# 1. Create a folder called "ansible" inside the ubuntu user's home directory
mkdir -p ~/ansible

# 2. Create a python virtual environment called "myansible" inside the "ansible" folder
python3 -m venv ~/ansible/myansible

# 3 & 4. Activate the virtual environment and install Ansible using pip3
source ~/ansible/myansible/bin/activate
pip3 install --upgrade pip
pip3 install ansible
EOF

# Ensure the .ssh directory exists with correct ownership and permissions for the target user
sudo -u "$TARGET_USER" mkdir -p "$SSH_DIR"
sudo -u "$TARGET_USER" chmod 700 "$SSH_DIR"

# Generate the SSH public-private key pair inside the user's .ssh directory (non-interactive, no passphrase)
sudo -u "$TARGET_USER" ssh-keygen -t rsa -b 4096 -f "$SSH_DIR/id_rsa" -N "" -q -C "ansible_test_server"

# Set correct permissions on the private and public keys
sudo -u "$TARGET_USER" chmod 600 "$SSH_DIR/id_rsa"
sudo -u "$TARGET_USER" chmod 644 "$SSH_DIR/id_rsa.pub"

# Optionally, add the generated public key to authorized_keys for local key-based testing
sudo -u "$TARGET_USER" cat "$SSH_DIR/id_rsa.pub" >> "$SSH_DIR/authorized_keys"
sudo -u "$TARGET_USER" chmod 600 "$SSH_DIR/authorized_keys"

