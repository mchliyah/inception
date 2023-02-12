#!/bin/sh


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& apt clean && rm -rf /var/lib/apt/lists/*

mv wp-cli.phar /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp core download --allow-root

wp config create --dbname=$DB_NAME \
    --dbuser=$DB_USER --dbpass=$DB_PASS \
    --dbhost=$DB_HOST --allow-root

wp core install --url=$DOMAIN_NAME \
--title=$SITE_TITLE \
--admin_user=$ADMIN_USER \
--admin_password=$ADMIN_PASS \
--admin_email=$ADMIN_EMAIL \
--allow-root

# mv wp-config-sample.php wp-config.php
exec "$@"
