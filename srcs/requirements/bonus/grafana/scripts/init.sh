< /etc/grafana/grafana_not_replaced.ini envsubst > /usr/share/grafana/grafana.ini

exec grafana-server --homepath=/usr/share/grafana \
  --config=/usr/share/grafana/grafana.ini \
  cfg:default.paths.data="/usr/share/grafana" \
  cfg:default.paths.logs="/usr/share/grafana" \
  cfg:default.paths.plugins="/usr/share/grafana/plugins"
