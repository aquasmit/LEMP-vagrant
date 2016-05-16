#!/bin/bash

echo "Provisioning virtual machine..."

# Git
echo "Installing Git"
sudo apt-get install git -y 
sudo apt-get update 

# Nginx
echo "Installing Nginx"
sudo apt-get install nginx -y 
sudo apt-get update 

# PHP
echo "Updating PHP repository"
sudo apt-get install python-software-properties build-essential -y 
sudo add-apt-repository ppa:ondrej/php5 -y 
sudo apt-get update 

echo "Installing PHP"
sudo apt-get install php5-common php5-dev php5-cli php5-fpm -y 

echo "Installing PHP extensions"
sudo apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y 

# MySQL 
echo "Preparing MySQL"
sudo apt-get install debconf-utils -y 
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

echo "Installing MySQL"
sudo apt-get install mysql-server -y 

# Nginx Configuration
echo "Configuring Nginx"
sudo cp /var/www/provision/config/nginx_vhost /etc/nginx/sites-available/nginx_vhost 
sudo ln -s /etc/nginx/sites-available/nginx_vhost /etc/nginx/sites-enabled/

sudo rm -rf /etc/nginx/sites-available/default

# Restart Nginx for the config to take effect
sudo service nginx restart 

echo "Installing Composer"
sudo curl -sS https://getcomposer.org/installer | sudo php
sudo mv composer.phar /usr/local/bin/composer

echo "Finished provisioning."