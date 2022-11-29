FROM debian:buster

RUN apt-get update
RUN apt-get install prometheus-node-exporter  -y

ENTRYPOINT  [ "prometheus-node-exporter" ]