FROM debian:buster

WORKDIR /var/www/html
# Install dependencies

COPY .env .env
RUN apt update -y \
    && apt install curl php php-mysql php-fpm mariadb-client -y \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& apt clean && rm -rf /var/lib/apt/lists/*

# Copy the existing wp-config-sample.php to create the wp-config.php file
RUN chmod +x wp-cli.phar && mkdir /run/php/
RUN mv wp-cli.phar /usr/local/bin/wp
# COPY requirements/wordpress/srcs/wp-config.php wp-config.php
COPY requirements/wordpress/tools/ /bin
# RUN chmod +x /bin/start.sh

# Replace the values in the wp-config.php file with environment variables
# RUN sed -i "s/database_name_here/$MDB_NAME/g" wp-config.php \
#     && sed -i "s/username_here/$MDB_USER/g" wp-config.php \
#     && sed -i "s/password_here/$MDB_PASS/g" wp-config.php \
#     && sed -i "s/localhost/$MDB_HOST/g" wp-config.php

COPY requirements/wordpress/srcs/www.conf /etc/php/7.3/fpm/pool.d

EXPOSE 9000
RUN ["chmod", "+x", "/bin/start.sh"]
# RUN wp core download --allow-root
# RUN wp config create --dbname=$MDB_NAME \
#     --dbuser=$MDB_USER --dbpass=$MDB_PASS \
#     --dbhost=$MDB_HOST --allow-root
# RUN wp core install --url=$DOMAIN_NAME \
# 	--title=$TITLE \
# 	--admin_user=$ADMIN_USER \
# 	--admin_password=$ADMIN_PASS \
# 	--admin_email=$ADMIN_EMAIL \
# 	--allow-root
# RUN php-fpm7.3 -R -F
