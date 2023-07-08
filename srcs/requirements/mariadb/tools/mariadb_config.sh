#!/bin/ash

mariadb-install-db --datadir=/var/lib/mysql --user=mysql

exec /usr/sbin/mariadb
