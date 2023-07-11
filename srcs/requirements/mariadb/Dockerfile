FROM alpine:3.17

RUN apk add --update mariadb \
		mariadb-client

ADD ./tools/mariadb_config.sh ./mariadb_config.sh
ADD ./conf/mariadb_server.conf /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ./mariadb_config.sh

VOLUME /var/lib/mysql

EXPOSE 3306
