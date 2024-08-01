#!/bin/bash

# Clear the terminal
clear

# Prompt for the domain name
read -p 'INSERT Domain Name: ' domainvalue

# Create the directory structure for the new virtual host
sudo mkdir -p /var/www/$domainvalue/public_html
sudo chown -R $USER:$USER /var/www/$domainvalue/public_html
sudo chown -R www-data:www-data /var/www/$domainvalue/public_html
sudo chmod -R 777 /var/www/$domainvalue/public_html

# Create a sample index.html file for the virtual host
cat <<EOL | sudo tee /var/www/$domainvalue/public_html/index.html
<html>
<head>
    <title>Welcome to $domainvalue!</title>
</head>
<body>
    <h1>Success! The $domainvalue virtual host is working!</h1>
</body>
</html>
EOL

# Create the virtual host configuration file
cat <<EOL | sudo tee /etc/apache2/sites-available/$domainvalue.conf
# Virtual Host Configuration for $domainvalue
<VirtualHost *:80>
    ServerAdmin dhakamicro@gmail.com
    ServerName $domainvalue
    DocumentRoot /var/www/$domainvalue/public_html
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL

# Enable the new virtual host and restart Apache
sudo a2ensite $domainvalue.conf
sudo systemctl restart apache2

echo "All Done!"

