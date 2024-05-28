#install OPEN-SSH server
sudo apt install openssh-server -y && sudo ufw allow ssh && echo "OpenSSH Server and Firewall Setup Success";


#Install Apache 2 Server
apt install apache2 -y && ufw app list && ufw app info "Apache Full" && ufw allow in "Apache Full" && echo "Apache Server and Firewall Setup Success"


#Install MYSQL Server
apt install mysql-server -y && mysql_secure_installation && echo "MYSQL Setup Success";

#Change MYSQL root User Password
$randomrootpassword = /dev/urandom | tr -dc 'a-z0-9' | fold -w 16 | head -n 1

$randomrootpassword=$(printf '%s' $(echo "$RANDOM" | md5sum) | cut -c 1-10)
#echo $random_string



mysql <<EOF
SELECT user,authentication_string,plugin,host FROM mysql.user;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$randomrootpassword';
FLUSH PRIVILEGES;
SELECT user,authentication_string,plugin,host FROM mysql.user;
EOF
				
#Install PHP 7.2
apt install php libapache2-mod-php php-mysql -y;

#install PHP MYADMIN
apt-get install phpmyadmin php-mbstring php-gettext -y;

#Enable Mod WreWrite
a2enmod rewrite;

#Reload Apache Service
systemctl restart apache2 && echo "APACHe 2 reloaded";

#Backup Apache Default COnfiguration
mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf_sample;

#Set new Apache Configuration (Development Mode)
cp apache2.conf /etc/apache2/apache2.conf && echo "Apache2 COnfiguration Updated";

#Reload Apache Service
systemctl restart apache2 && echo "APACHe 2 reloaded";

#Generate PHP Info File
echo "<?php phpinfo();?>" > /var/www/html/info.php && echo "php info file created";

#Reload Apache Service
systemctl restart apache2 && echo "APACHe 2 reloaded";

#Print Php Info Link
echo "Visit http://localhost/info.php";

#Backup Default PHP COnfiguration
mv /etc/php/7.2/apache2/php.ini /etc/php/7.2/apache2/php.ini_sample && echo "Default PHP Configuration BackedUP"

#Generate new PHP Configuration (Development Mode)
cp php.ini /etc/php/7.2/apache2/php.ini && echo "PHP  COnfiguration Updated";


#Create New Secure User for MYSQL Access









