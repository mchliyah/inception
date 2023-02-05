FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl


RUN openssl req -x509 -sha256 -nodes -days 365 \
-subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=llescure/CN=mchliyah.42.fr" \
-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt;

COPY requirements/nginx/srcs/default /etc/nginx/sites-available/

EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
