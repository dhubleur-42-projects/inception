FROM debian:buster

RUN apt-get update
RUN apt-get install redis -y

COPY ./scripts/init.sh /var/redis_init.sh

ENTRYPOINT [ "sh", "/var/redis_init.sh" ]