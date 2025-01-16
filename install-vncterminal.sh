#!/bin/bash

# Update package lists
echo "Cloning repository..."
git clone https://github.com/fhmunna/vncterminal

cd vncterminal/
# Upgrade all packages
echo "building image..."
docker build -t kasm-image .


# Install prerequisites
echo "running image..."
docker run  -d -p 3000:3000 -p 3001:3001 --name vncterminal kasm-image
docker update --restart always vncterminal

echo "Done !"
