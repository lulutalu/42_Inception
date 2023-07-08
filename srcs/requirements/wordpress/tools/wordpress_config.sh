#!/bin/ash

while ! mariadb -h mariadb -u "$DB_USER" -p"$DB_PASS" "$DB_NAME"; do
  sleep 3
done

cd /var/www/wordpress

wp core download

wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASS}" \
		--dbhost=mariadb --locale=en_US --skip-check

wp core install --url="${WP_URL}" --title="${WP_TITLE}" --admin_user="${WP_ADMINUSER}" \
	--admin_password="${WP_ADMINPASS}" --admin_email="${WP_ADMINEMAIL}" --locale=en_US --skip-email

wp user create "${WP_USER}" "${WP_USERMAIL}" --user_pass="${WP_USERPASS}" --role=author

exec /usr/sbin/php-fpm81 -F -O
