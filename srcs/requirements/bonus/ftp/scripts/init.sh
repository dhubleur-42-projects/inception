PROTECT_FILE="/etc/vsftpd/.vsftpd_protect"

if [ ! -f "$PROTECT_FILE" ]; then
	adduser $FTP_USR --gecos "$FTP_USR FTP,RoomNumber,WorkPhone,HomePhone" --disabled-password
    echo "$FTP_USR:$FTP_PASSWORD" | /usr/sbin/chpasswd
    chown -R $FTP_USR:$FTP_USR /var/www/html

    echo $FTP_USR | tee -a /etc/vsftpd.userlist

	touch $PROTECT_FILE
fi

echo "FTP started on port 21"
exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf