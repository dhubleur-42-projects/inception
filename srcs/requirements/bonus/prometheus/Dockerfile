FROM debian:buster

RUN apt-get update

RUN apt-get install prometheus -y

COPY ./config/prometheus.yml /etc/prometheus/prometheus.yml

ENTRYPOINT [ "prometheus" ]