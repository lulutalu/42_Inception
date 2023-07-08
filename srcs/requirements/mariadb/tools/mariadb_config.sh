#!/bin/ash

mariadb-install-db --datadir=/var/lib/mysql --user=mysql --auth-root-authentication-method=normal

/usr/bin/mariadbd-safe --datadir=/var/lib/mysql &
sleep 2

mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ADMINPASS}'; FLUSH PRIVILEGES;"

mariadb -u root -p${DB_ADMINPASS} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"

mariadb -u root -p${DB_ADMINPASS} -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}'; GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%'; FLUSH PRIVILEGES;"

mariadb-admin -u root -p${DB_ADMINPASS} shutdown

exec /usr/bin/mariadbd-safe --datadir=/var/lib/mysql
