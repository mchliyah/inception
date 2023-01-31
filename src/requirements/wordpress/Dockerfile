FROM debian:buster

WORKDIR /var/www/html
# Install dependencies

RUN apt-get update && apt-get install -y \
    curl \
    php \
    php-mysql \
    php-fpm

# Copy the existing wp-config-sample.php to create the wp-config.php file
COPY wp-config-sample.php wp-config.php

# Replace the values in the wp-config.php file with environment variables
RUN sed -i "s/database_name_here/$MDB_NAME/g" wp-config.php \
    && sed -i "s/username_here/$MDB_USER/g" wp-config.php \
    && sed -i "s/password_here/$MDB_PASSWORD/g" wp-config.php \
    && sed -i "s/localhost/$MDB_HOST/g" wp-config.php