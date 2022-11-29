PROTECT_FILE="/var/www/html/adminer/index.php"

if  [ ! -f "$PROTECT_FILE" ]; then
    wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php"
    mv adminer-4.8.1.php index.php
fi

exec php-fpm7 --nodaemonize