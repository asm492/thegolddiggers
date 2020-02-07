#!/bin/bash
ENV DEBIAN_FRONTEND=noninteractive

sudo apt-get update && apt-get upgrade
sudo apt-get install -y apache2 libapache2-mod-php php-mysql
sudo rm /var/www/html/index.html
git clone https://avleensm@bitbucket.org/Jarltl/gruppe-25.git
cd gruppe-25
cp code/* /var/www/html/
cp config_example.php /var/www/html/config.php
sudo service apache2 restart
