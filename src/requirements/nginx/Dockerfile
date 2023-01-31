FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

COPY requirements/nginx/srcs/default /etc/nginx/sites-enabled/default
COPY requirements/tools/index.html /usr/share/nginx/html

RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=mchliyah-x360-G2" -addext "subjectAltName=DNS:mchliyah-x360-G2" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
