FROM alpine:3.17

ENV DOMAIN_NAME=localhost

RUN apk add --update nginx \
		&& apk add openssl \
		&& rm -rf /var/cache/apk/*

ADD ./conf/nginx.conf /etc/nginx/http.d/nginx.conf
ADD ./tools/nginx_conf.sh /nginx_conf.sh

ENTRYPOINT /nginx_conf.sh

EXPOSE 443/tcp
