#!/bin/bash

service vsftpd start

# Add the USER, change his password and declare him as the owner of wordpress folder and all subfolders

adduser $FTP_USER --disabled-password

echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd

#Add the FTP user to the list of allowed users in the vsftpd configuration file /etc/vsftpd.userlist using the tee command.

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist 


mkdir /home/$FTP_USER/ftp


chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp

service vsftpd stop