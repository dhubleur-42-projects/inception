PROTECT_FILE="/var/lib/mysql/.mysql_protect"

if [ ! -f "$PROTECT_FILE" ]; then
	< /var/mysql/init.sql envsubst > /var/mysql/init_env_replaced.sql

	service mysql start
	mysql -D mysql < /var/mysql/init_env_replaced.sql
	service mysql stop
	touch "$PROTECT_FILE"
fi

exec mysqld_safe