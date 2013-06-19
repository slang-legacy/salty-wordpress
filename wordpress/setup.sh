mkdir /var/www/
cd /var/www/
wget http://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
rm latest.tar.gz
chown www-data:www-data -R /var/www/wordpress