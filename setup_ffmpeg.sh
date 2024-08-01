#!/bin/bash

# Clear the terminal
clear

# Update the system package list
echo "Updating system package list..."
sudo apt update

# Install necessary packages
echo "Installing necessary packages..."
sudo apt install -y software-properties-common

# Add the FFmpeg PPA repository
echo "Adding FFmpeg PPA repository..."
sudo add-apt-repository ppa:jonathonf/ffmpeg-4

# Update the system package list again
echo "Updating system package list again..."
sudo apt update

# Install FFmpeg
echo "Installing FFmpeg..."
sudo apt install -y ffmpeg

# Verify FFmpeg installation
echo "Verifying FFmpeg installation..."
ffmpeg -version

# Print completion message
echo "FFmpeg setup completed successfully."
