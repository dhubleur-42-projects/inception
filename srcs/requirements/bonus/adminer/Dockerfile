FROM  alpine:3.14

RUN apk update
RUN apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7 php7-fpm php7-opcache php7-session

COPY ./config/php.conf /etc/php7/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/adminer
WORKDIR /var/www/html/adminer

RUN mkdir -p /var/adminer
COPY ./scripts/init.sh /var/adminer/init.sh

RUN addgroup -S adminer && adduser -S adminer -G adminer

ENTRYPOINT ["sh", "/var/adminer/init.sh"] 