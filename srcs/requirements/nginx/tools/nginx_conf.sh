#!/bin/ash

openssl req -x509 -newkey rsa:4096 \
		-keyout /etc/ssl/key.pem \
		-out /etc/ssl/fullchain.pem \
		-sha256 -days 3650 -nodes -subj \
		"/C=CH/ST=Vaud/L=Lausanne/O=42/OU=XXX/CN=$DOMAIN_NAME"

exec /usr/sbin/nginx -g "daemon off;"
