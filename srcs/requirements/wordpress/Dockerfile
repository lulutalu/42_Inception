FROM alpine:3.17

RUN apk add --update php \
		php-fpm \
		php-mysqli \
		php-phar \
		wget \
		curl \
		mariadb-client \
		php-iconv

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/local/bin/wp \
		&& chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress \
	&& mkdir -p /run/php \
	&& chown -R xfs /var/www/ \
	&& chown -R xfs /etc/php81/ \
	&& chown -R xfs /proc/self/fd/2 \
	&& chown -R xfs /run/php

ADD ./conf/php.conf.ini /etc/php81/php-fpm.d/php-ini.conf
ADD ./tools/wordpress_config.sh ./wordpress_config.sh

ENTRYPOINT ./wordpress_config.sh
