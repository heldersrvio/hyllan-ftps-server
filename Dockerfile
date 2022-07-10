FROM alpine:3.6

MAINTAINER Helder SÉRVIO <heldersrvio@gmail.com>

RUN apk update && apk upgrade && apk add openssl vsftpd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem -subj "/C=BR/O=./CN=Hyllan"

RUN mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog
RUN mkdir -p /data/

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY start.sh /usr/sbin/start.sh

RUN chmod +x /usr/sbin/start.sh

CMD /usr/sbin/start.sh

