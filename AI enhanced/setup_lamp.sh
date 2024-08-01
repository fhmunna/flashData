#!/bin/bash

# Install OpenSSH server
sudo apt install openssh-server -y
sudo ufw allow ssh
echo "OpenSSH Server and Firewall Setup Success"

# Install Apache 2 Server
sudo apt install apache2 -y
sudo ufw app list
sudo ufw app info "Apache Full"
sudo ufw allow in "Apache Full"
echo "Apache Server and Firewall Setup Success"

# Install MySQL Server
sudo apt install mysql-server -y
sudo mysql_secure_installation
echo "MySQL Setup Success"

# Change MySQL root User Password
randomrootpassword=$(tr -dc 'a-z0-9' </dev/urandom | fold -w 16 | head -n 1)

sudo mysql <<EOF
SELECT user, authentication_string, plugin, host FROM mysql.user;
ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '$randomrootpassword';
FLUSH PRIVILEGES;
SELECT user, authentication_string, plugin, host FROM mysql.user;
EOF

echo "MySQL root user password changed to: $randomrootpassword"

# Install PHP 7.2
sudo apt install php libapache2-mod-php php-mysql -y

# Install phpMyAdmin
sudo apt-get install phpmyadmin php-mbstring php-gettext -y

# Enable mod_rewrite
sudo a2enmod rewrite

# Reload Apache Service
sudo systemctl restart apache2
echo "Apache 2 reloaded"

# Backup Apache Default Configuration
sudo mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf_sample

# Set new Apache Configuration (Development Mode)
sudo cp apache2.conf /etc/apache2/apache2.conf
echo "Apache2 Configuration Updated"

# Reload Apache Service
sudo systemctl restart apache2
echo "Apache 2 reloaded"

# Generate PHP Info File
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php
echo "PHP info file created"

# Reload Apache Service
sudo systemctl restart apache2
echo "Apache 2 reloaded"

# Print PHP Info Link
echo "Visit http://localhost/info.php"

# Backup Default PHP Configuration
sudo mv /etc/php/7.2/apache2/php.ini /etc/php/7.2/apache2/php.ini_sample
echo "Default PHP Configuration Backed Up"

# Generate new PHP Configuration (Development Mode)
sudo cp php.ini /etc/php/7.2/apache2/php.ini
echo "PHP Configuration Updated"

# Create New Secure User for MySQL Access (if necessary)
# Add your commands here to create a new MySQL user with secure access

