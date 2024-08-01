#!/bin/bash

# Clear the terminal
clear

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y
echo "System updated and upgraded."

# Install necessary build tools
sudo apt install build-essential -y
echo "Build-essential installed."

# Install Node.js and npm
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs -y
echo "Node.js and npm installed."

# Verify the installation
node -v
npm -v

# Install global npm packages
sudo npm install -g nodemon pm2 eslint
echo "Global npm packages installed: nodemon, pm2, eslint."

# Prompt for the project name
read -p 'Enter your project name: ' projectname

# Create the project directory
mkdir -p ~/$projectname
cd ~/$projectname

# Initialize a new Node.js project
npm init -y
echo "Node.js project initialized."

# Create a basic server file
cat <<EOL > server.js
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World\n');
});

server.listen(port, hostname, () => {
  console.log(\`Server running at http://\${hostname}:\${port}/\`);
});
EOL
echo "Basic server file created."

# Create a basic .eslintrc.json configuration file
cat <<EOL > .eslintrc.json
{
  "env": {
    "browser": true,
    "es2021": true,
    "node": true
  },
  "extends": "eslint:recommended",
  "parserOptions": {
    "ecmaVersion": 12,
    "sourceType": "module"
  },
  "rules": {
  }
}
EOL
echo "ESLint configuration file created."

# Install project-specific npm packages
npm install express
echo "Express installed for the project."

# Print completion message
echo "Node.js development environment setup completed successfully."

# Print the project directory
echo "Your project directory is: ~/$projectname"
