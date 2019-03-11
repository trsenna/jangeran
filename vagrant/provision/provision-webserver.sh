#!/usr/bin/env bash

#====================================================
#== Apache2 & PHP
#====================================================
apt-get -y install \
  apache2 libapache2-mod-php7.2

apt-get -y install \
  php7.2 \
  php7.2-cli php7.2-common php7.2-dev \
  php7.2-pgsql php7.2-sqlite3 php7.2-gd \
  php7.2-curl php7.2-memcached \
  php7.2-imap php7.2-mysql php7.2-mbstring \
  php7.2-xml php7.2-zip php7.2-bcmath php7.2-soap \
  php7.2-intl php7.2-readline php7.2-opcache \
  php7.2-xmlrpc php7.2-xsl php7.2-json \
  php7.2-bz2 php7.2-imagick \
  php-pear

cat /vagrant/files/000-default.conf > /etc/apache2/sites-available/000-default.conf

sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.2/apache2/php.ini
sed -i "s/post_max_size = .*/post_max_size = 64M/" /etc/php/7.2/apache2/php.ini
sed -i "s/upload_max_filesize = .*/upload_max_filesize = 32M/" /etc/php/7.2/apache2/php.ini

a2enmod expires
a2enmod headers
a2enmod include
a2enmod rewrite

#== run with different user ==
sed -ri 's/^(export APACHE_RUN_USER=)(.*)$/\1vagrant/' /etc/apache2/envvars
sed -ri 's/^(export APACHE_RUN_GROUP=)(.*)$/\1vagrant/' /etc/apache2/envvars

chown -R vagrant:vagrant /var/lock/apache2
chown -R vagrant:vagrant /var/log/apache2
chown -R vagrant:vagrant /var/www

#== service restart ==
service apache2 restart





#====================================================
#== Composer
#====================================================
if [ ! -f "/usr/local/bin/composer" ]; then
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
fi





#====================================================
#== WP-CLI
#====================================================
if [ ! -f "/usr/local/bin/wp" ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
fi
