FROM debian:buster

EXPOSE 3000

RUN apt-get update
RUN apt-get install apt-transport-https software-properties-common gnupg wget -y
RUN wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
RUN echo "deb https://packages.grafana.com/oss/deb stable main" | tee -a /etc/apt/sources.list.d/grafana.list
RUN apt-get update
RUN apt-get install grafana -y

RUN apt-get install gettext-base -y

COPY ./scripts/init.sh /var/init_grafana.sh

RUN mkdir -p /etc/grafana

COPY ./config/grafana.ini /etc/grafana/grafana_not_replaced.ini
COPY ./config/prometheus.yaml /usr/share/grafana/conf/provisioning/datasources/datasource.yaml
COPY ./config/dashboard.json /usr/share/grafana/public/dashboards/monitoring_dashboard.json
COPY ./config/dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/dashboard.yaml

ENTRYPOINT [ "sh", "/var/init_grafana.sh" ]