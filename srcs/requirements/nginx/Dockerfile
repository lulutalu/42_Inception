FROM alpine:3.17

RUN apk add --update nginx \
		&& apk add openssl

RUN mkdir -p /var/www/wordpress \
		&& chown -R xfs /var/www

ADD ./conf/nginx.conf /etc/nginx/http.d/nginx.conf
ADD ./tools/nginx_conf.sh /nginx_conf.sh

ENTRYPOINT /nginx_conf.sh

VOLUME /var/www/wordpress

EXPOSE 443/tcp
