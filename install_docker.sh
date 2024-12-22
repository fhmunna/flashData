#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update

# Upgrade all packages
echo "Upgrading all packages..."
sudo apt upgrade -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the Docker repository
echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package lists again to include Docker packages
echo "Updating package lists for Docker..."
sudo apt update

# Install Docker packages
echo "Installing Docker packages..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Add current user to the Docker group
echo "Adding current user to Docker group..."
sudo usermod -aG docker $USER

# Display Docker version
echo "Verifying Docker installation..."
docker --version

echo "Docker installation completed successfully!"
echo "Please log out and log back in for the changes to take effect (Docker group permissions)."

