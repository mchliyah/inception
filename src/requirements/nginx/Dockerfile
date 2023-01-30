FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install openssl

COPY requirements/nginx/srcs/default /etc/nginx/sites-enabled/default
COPY requirements/tools/index.html /usr/share/nginx/html

RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=localhost" -addext "subjectAltName=DNS:localhost" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
