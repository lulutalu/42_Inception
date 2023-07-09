#!/bin/ash

while ! mysql -h mariadb -u $DB_USER -p$DB_PASS $DB_NAME; do
  sleep 3
done

sed -i "s|^listen = .*$|listen = 0.0.0.0:9000|" /etc/php81/php-fpm.d/www.conf
sed -i "s|^;cgi.fix_pathinfo=1|cgi.fix_pathinfo=0|" /etc/php81/php.ini

echo "Connection successful with db"

cd /var/www/wordpress

wp core download

wp core config --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}" \
		--dbhost=mariadb --locale=en_US --debug=true;

wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMINUSER}" \
	--admin_password="${WP_ADMINPASS}" --admin_email="${WP_ADMINEMAIL}" --locale=en_US --skip-email

wp plugin update --all

wp user create "${WP_USER}" "${WP_USEREMAIL}" --user_pass="${WP_USERPASS}" --role=author

exec /usr/sbin/php-fpm81 -F -O
