#!/bin/bash

# Update and install required packages
sudo apt-get update
sudo apt-get install -y apache2 php libapache2-mod-php php-mysql

# Download and configure WordPress
wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz
sudo cp -R wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

# Configure Apache
sudo mv /etc/apache2/apache2.conf /etc/apache2/apache2.conf.bak
sudo cp wordpress-apache.conf /etc/apache2/apache2.conf
sudo service apache2 restart

# Clean up
rm latest.tar.gz
rm -rf wordpress

echo "WordPress deployed successfully!"
