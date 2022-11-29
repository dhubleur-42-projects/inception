FROM debian:buster

EXPOSE 443

RUN apt-get update
RUN apt-get install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl/private
RUN mkdir -p /etc/nginx/ssl/certs
RUN openssl req -x509 -newkey rsa:4096 -nodes -sha256 -days 365 \
    -out /etc/nginx/ssl/certs/dhubleur.42.fr.pem \
    -keyout /etc/nginx/ssl/private/dhubleur.42.fr.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=IT/CN=dhubleur.42.fr"
RUN openssl req -x509 -newkey rsa:4096 -nodes -sha256 -days 365 \
    -out /etc/nginx/ssl/certs/data.42.fr.pem \
    -keyout /etc/nginx/ssl/private/data.42.fr.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=IT/CN=data.42.fr"
RUN openssl req -x509 -newkey rsa:4096 -nodes -sha256 -days 365 \
    -out /etc/nginx/ssl/certs/stats.42.fr.pem \
    -keyout /etc/nginx/ssl/private/stats.42.fr.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=IT/CN=stats.42.fr"
RUN openssl req -x509 -newkey rsa:4096 -nodes -sha256 -days 365 \
    -out /etc/nginx/ssl/certs/resume.42.fr.pem \
    -keyout /etc/nginx/ssl/private/resume.42.fr.key \
    -subj "/C=FR/ST=Paris/L=Paris/O=42Paris/OU=IT/CN=resume.42.fr"

RUN mkdir -p /var/www/resume_site
COPY ./site /var/www/resume_site

COPY ./config/nginx.conf /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]
