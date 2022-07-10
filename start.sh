mkdir -p /home/vsftpd/$USER
addgroup -g 433 -S $USER
adduser -u 431 -D -G $USER -s /bin/false -h /home/vsftpd/$USER $USER
echo "$USER:$PASSWORD" | /usr/sbin/chpasswd

chown -R $USER:$USER /home/vsftpd/$USER/

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
