FROM debian:buster

RUN apt update -y && \
    apt upgrade -y

RUN apt install vsftpd -y

COPY requirements/bonus/ftp/tools/script.sh /
RUN  chmod +x /script.sh

COPY requirements/bonus/ftp/tools/vsftpd.conf /etc/vsftpd.conf

# RUN service vsftpd start

# # Add the USER, change his password and declare him as the owner of wordpress folder and all subfolders

# RUN useradd -m $FTP_USER --disabled-password

# RUN echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd

# #Add the FTP user to the list of allowed users in the vsftpd configuration file /etc/vsftpd.userlist using the tee command.

# RUN echo "$FTP_USER" | tee -a /etc/vsftpd.userlist 


# RUN mkdir /home/$FTP_USER/ftp


# RUN chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp

# RUN service vsftpd stop

CMD ["/script.sh"]
# CMD ["vsftpd"]
