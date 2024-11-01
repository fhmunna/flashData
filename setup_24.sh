#!/bin/bash

# Clear the terminal
clear

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y
echo "System updated and upgraded."

# Install Sublime Text (latest version)
echo "Installing Sublime Text..."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt update
sudo apt install sublime-text -y
echo "Sublime Text installed."

# Install Visual Studio Code (latest version)
echo "Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install code -y
echo "Visual Studio Code installed."

# Install Android Studio (latest version)
echo "Installing Android Studio..."
sudo add-apt-repository ppa:maarten-fonville/android-studio -y
sudo apt update
sudo apt install android-studio -y
echo "Android Studio installed."

# Install PyCharm Community Edition (latest version)
echo "Installing PyCharm Community Edition..."
sudo snap install pycharm-community --classic
echo "PyCharm Community Edition installed."

# Print completion message
echo "IDE setup completed successfully."

# Verify the installations
echo "Verifying installations..."
subl --version
code --version
studio.sh --version
pycharm-community --version

echo "All IDEs are installed and verified."
