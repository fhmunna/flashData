#quick SYnc you Local Repo with repo
clear
read -p 'INSERT Domain Name: ' domainvalue

sudo mkdir -p /var/www/$domainvalue/public_html
sudo chown -R $USER:$USER /var/www/$domainvalue/public_html
sudo chown -R www-data:www-data /var/www/$domainvalue/public_html
sudo chmod -R 777 /var/www/$domainvalue/public_html


echo "<html>" > /var/www/$domainvalue/public_html/index.html
echo "<head>" >> /var/www/$domainvalue/public_html/index.html
echo "<title>Welcome to "$domainvalue"!</title>" >> /var/www/$domainvalue/public_html/index.html
echo "</head>" >> /var/www/$domainvalue/public_html/index.html
echo "<body>" >> /var/www/$domainvalue/public_html/index.html
echo "<h1>Success! The" $domainvalue "virtual host is working!</h1>" >> /var/www/$domainvalue/public_html/index.html
echo " </body>" >> /var/www/$domainvalue/public_html/index.html
echo "</html>" >> /var/www/$domainvalue/public_html/index.html


sudo echo "#virtual Host Configuration for "$fomainvalue > /etc/apache2/sites-available/$domainvalue.conf
sudo echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$domainvalue.conf
sudo echo "ServerAdmin dhakamicro@gmail.com" >> /etc/apache2/sites-available/$domainvalue.conf
sudo echo "DocumentRoot /var/www/"$domainvalue"/public_html" >> /etc/apache2/sites-available/$domainvalue.conf
sudo echo "ErrorLog ${APACHE_LOG_DIR}/error.log" >> /etc/apache2/sites-available/$domainvalue.conf
sudo echo "CustomLog ${APACHE_LOG_DIR}/access.log combined" >> /etc/apache2/sites-available/$domainvalue.conf
sudo echo "</VirtualHost>" >> /etc/apache2/sites-available/$domainvalue.conf

sudo a2ensite $domainvalue.conf
sudo systemctl restart apache2

echo "All Done !"
