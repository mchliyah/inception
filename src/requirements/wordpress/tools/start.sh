#!/bin/sh

# if [ -f wp-config.php ]
# then
# 	echo "wordpress already downloaded"
# else
# 	#Download wordpress
# 	# rm -rf /var/www/html/*
# 	wget https://wordpress.org/latest.tar.gz
# 	tar -xzvf latest.tar.gz
# 	cp -r wordpress/* /var/www/html/
# 	rm -rf latest.tar.gz wordpress

# 	#Update configuration file
# 	# rm -rf /etc/php/7.3/fpm/pool.d/www.conf
# 	# cp ./www.conf /etc/php/7.3/fpm/pool.d

# 	#Inport env variables in the config file
# 	cd /var/www/html
# 	sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
# 	sed -i "s/password_here/$DB_PASS/g" wp-config-sample.php
# 	sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
# 	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
# 	mv wp-config-sample.php wp-config.php

# fi

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& apt clean && rm -rf /var/lib/apt/lists/*

mv wp-cli.phar /usr/local/bin/wp
chmod +x /usr/local/bin/wp

#waiting for mysql to be ready
# while ! mysqladmin ping -h"$DB_HOST" --silent; do
# 	sleep 1
# done
wp core download --allow-root

# sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
# sed -i "s/password_here/$DB_PASS/g" wp-config-sample.php
# sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
# sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
# mv wp-config-sample.php wp-config.php

wp config create --dbname=$MDB_NAME \
    --dbuser=$MDB_USER --dbpass=$MDB_PASS \
    --dbhost=$MDB_HOST --allow-root

wp core install --url=$DOMAIN_NAME \
--title=$TITLE \
--admin_user=$ADMIN_USER \
--admin_password=$ADMIN_PASS \
--admin_email=$ADMIN_EMAIL \
--allow-root

# mv wp-config-sample.php wp-config.php

/usr/sbin/php-fpm7.3 -F
exec "$@"
