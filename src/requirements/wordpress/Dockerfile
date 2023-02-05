FROM debian:buster

#Install necessary package from php

RUN apt update -y \
    && apt install curl php php-mysql php-fpm mariadb-client -y

#     && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
# 	&& apt clean && rm -rf /var/lib/apt/lists/*

RUN apt-get -y install \
wget \
php \
php-cgi \
php-mysql \
php-fpm \
php-pdo \
php-gd php-cli \
php-mbstring \
&& rm -rf /var/lib/apt/lists/*

#Create the folder to enable php start
RUN mkdir -p /run/php
# RUN mkdir /var/www
# RUN mkdir /var/www/html
# RUN chmod +x wp-cli.phar\
# 	&& mv wp-cli.phar /usr/local/bin/wp \
# 	&& wp core download --path=/var/www/html --allow-root \
# 	&& cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
# RUN mv wp-cli.phar /usr/local/bin/wp

#Copy the necessary tools to download wordpress

COPY requirements/wordpress/srcs/www.conf /etc/php/7.3/fpm/pool.d



#Launch script
WORKDIR /var/www/html

COPY requirements/wordpress/tools/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh
EXPOSE 9000

ENTRYPOINT ["start.sh"]

CMD ["php-fpm7.3", "-F"]