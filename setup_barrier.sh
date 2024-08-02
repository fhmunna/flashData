#!/bin/bash

# Clear the terminal
clear

# Update the system package list
echo "Updating system package list..."
sudo apt update

# Install necessary packages
echo "Installing necessary packages..."
sudo apt install -y software-properties-common wget

# Add the Barrier PPA repository
echo "Adding Barrier PPA repository..."
sudo add-apt-repository ppa:debs-barrier/ppa

# Update the system package list again
echo "Updating system package list again..."
sudo apt update

# Install Barrier 2.4
echo "Installing Barrier 2.4..."
sudo apt install -y barrier

# Verify Barrier installation
echo "Verifying Barrier installation..."
barrier --version

# Print completion message
echo "Barrier 2.4 setup completed successfully."

