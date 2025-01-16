#!/bin/bash

# Android Studio Installation Script for Alpine Linux
# Author: Your Name
# Date: $(date)

set -e

echo "Updating Alpine Linux packages..."
apk update && apk upgrade

echo "Installing required packages..."
apk add openjdk17 bash curl wget unzip libc6-compat libstdc++ libgcc

echo "Installing glibc..."
if [ ! -f /etc/apk/keys/sgerrand.rsa.pub ]; then
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
fi
wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r2/glibc-2.35-r2.apk
apk add glibc-2.35-r2.apk
rm -f glibc-2.35-r2.apk

echo "Downloading Android Studio..."
ANDROID_STUDIO_URL="https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.22/android-studio-2023.1.1.22-linux.tar.gz"
wget -q $ANDROID_STUDIO_URL -O android-studio-linux.tar.gz

echo "Extracting Android Studio..."
tar -xzf android-studio-linux.tar.gz -C /opt
rm -f android-studio-linux.tar.gz

echo "Setting up environment variables..."
if ! grep -q "ANDROID_STUDIO_HOME" ~/.bashrc; then
    echo 'export ANDROID_STUDIO_HOME=/opt/android-studio' >> ~/.bashrc
    echo 'export PATH=$PATH:$ANDROID_STUDIO_HOME/bin' >> ~/.bashrc
    source ~/.bashrc
fi

echo "Android Studio installation completed successfully."
echo "To start Android Studio, run: studio.sh"
