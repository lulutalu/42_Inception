FROM alpine:3.17

RUN apk add --update php \
		&& apk add --update php-fpm \
		&& apk add --update php-mysqli \
		&& apk add --update php-phar \
		&& apk add --update wget \
		&& apk add --update curl \
		&& apk add --update mariadb-client

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/local/bin/wp \
		&& chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress

ADD ./tools/wordpress_config.sh ./wordpress_config.sh

ENTRYPOINT ./wordpress_config.sh
