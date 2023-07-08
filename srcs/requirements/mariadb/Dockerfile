FROM alpine:3.17

RUN apk add --update mariadb \
		&& apk add --update mariadb-client

RUN chown -R mysql /var/lib/mysql

ADD ./tools/mariadb_config.sh ./mariadb_config.sh

ENTRYPOINT ./mariadb_config.sh

EXPOSE 3306
