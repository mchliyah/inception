#!/bin/sh
adduser --disabled-password --gecos '' $FTP_USER
echo $FTP_USER:$FTP_PASS | chpasswd
mkdir -p /home/$FTP_USER/ftp
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp
mkdir -p /home/$FTP_USER/empty
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/empty
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

vsftpd
