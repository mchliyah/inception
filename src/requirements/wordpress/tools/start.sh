#!/bin/bash

source .env

wp core download --allow-root

wp config create --dbname=$MDB_NAME \
    --dbuser=$MDB_USER --dbpass=$MDB_PASS \
    --dbhost=$MDB_HOST --allow-root

wp core install --url=$DOMAIN_NAME \
	--title=$TITLE \
	--admin_user=$ADMIN_USER \
	--admin_password=$ADMIN_PASS \
	--admin_email=$ADMIN_EMAIL \
	--allow-root
php-fpm7.3 -R -F