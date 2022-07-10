addgroup -g 433 -S $USER
adduser -u 431 -D -G $USER -s /bin/false -h /data $USER
echo "$USER:$PASSWORD" | /usr/sbin/chpasswd

chown -R $USER:$USER /data

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
