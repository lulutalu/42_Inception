FROM alpine:3.17

RUN apk add --update mariadb \
		mariadb-client

ADD ./tools/mariadb_config.sh ./mariadb_config.sh
ADD ./conf/mariadb_server.conf /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ./mariadb_config.sh

#ENV DB_ADMINPASS=test
#ENV DB_USER=lduboulo
#ENV DB_PASS=123Soleil
#ENV DB_NAME=inception

#EXPOSE 3306
