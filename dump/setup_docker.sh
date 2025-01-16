#!/bin/bash

# Clear the terminal
clear

# Update the system package list
echo "Updating system package list..."
sudo apt update

# Install necessary packages
echo "Installing necessary packages..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker APT repository
echo "Adding Docker APT repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

# Update the system package list again
echo "Updating system package list again..."
sudo apt update

# Ensure Docker is installed from the Docker repository instead of the default Ubuntu repository
echo "Checking Docker-CE installation source..."
apt-cache policy docker-ce

# Install Docker
echo "Installing Docker..."
sudo apt install -y docker-ce

# Check Docker service status
echo "Checking Docker service status..."
sudo systemctl status docker

# Start Docker service if not already running
echo "Starting Docker service..."
sudo systemctl start docker

# Enable Docker to start on boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker

# Add the current user to the docker group to run docker commands without sudo
echo "Adding the current user to the docker group..."
sudo usermod -aG docker ${USER}

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version

# Verify Docker Compose installation
echo "Verifying Docker Compose installation..."
docker-compose --version

# Print completion message
echo "Docker and Docker Compose setup completed successfully."

# Suggest logging out and back in for group changes to take effect
echo "Please log out and log back in to apply the group changes."
