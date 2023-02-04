FROM debian:buster

#Install necessary package from php

RUN apt-get update && apt-get -y install \
wget \
php \
php-cgi \
php-mysql \
php-fpm \
php-pdo \
php-gd php-cli \
php-mbstring \
&& rm -rf /var/lib/apt/lists/*

#Copy the necessary tools to download wordpress

COPY requirements/wordpress/srcs/www.conf /var/www/html/

#Create the folder to enable php start

RUN mkdir /run/php

#Launch script

COPY requirements/wordpress/tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh
ENTRYPOINT ["start.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
