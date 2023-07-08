#!/bin/ash

mariadb-install-db --datadir=/var/lib/mysql --user=mysql

exec mariadbd-safe
