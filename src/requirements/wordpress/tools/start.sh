#!/bin/sh

chown -R www-data:www-data /var/www/html

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


wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root

wp theme install twentytwentytwo --activate --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php
wp config set WP_REDIS_HOST redis --allow-root

wp redis enable --allow-root

# mv wp-config-sample.php wp-config.php
exec "$@"
