FROM debian:buster

EXPOSE 21

RUN apt-get update
RUN apt-get install vsftpd -y

RUN mkdir -p /etc/vsftpd
COPY ./config/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./scripts/init.sh /etc/vsftpd/init.sh

RUN mkdir -p /var/run/vsftpd/empty

ENTRYPOINT [ "sh", "/etc/vsftpd/init.sh" ]