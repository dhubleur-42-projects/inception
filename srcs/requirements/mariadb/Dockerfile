FROM debian:buster

RUN apt-get update
RUN apt-get install mariadb-server mariadb-client -y
RUN apt-get install gettext-base procps -y

RUN mkdir -p /var/lib/mysql
RUN	mkdir -p /run/mysqld
RUN chown -R mysql:root /run/mysqld

COPY ./config/server.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./scripts/init.sh /var/mysql/init.sh
COPY ./scripts/init.sql /var/mysql/init.sql

ENTRYPOINT ["sh", "/var/mysql/init.sh"] 