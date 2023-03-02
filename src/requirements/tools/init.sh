#!/bin/bash

source .env

# Start the MariaDB service
service mysql start

# Create a new database
mysql -e "CREATE DATABASE ${DB_NAME};"

# Create a new user and grant permissions
mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
mysql -u root --password=${DB_PASS} -e "use mysql; update user set password = password('${DB_PASS}') , plugin = '' where user = 'root';"
# Flush the privileges
mysql -e "FLUSH PRIVILEGES;"

# Create admin user
mysql -u ${ADMIN_USER} --password=${DB_PASS} -e "CREATE USER '${ADMIN_USER}'@'%' IDENTIFIED BY '${ADMIN_PASS}';"
mysql -u ${ADMIN_USER} --password=${DB_PASS} -e "GRANT ALL PRIVILEGES ON *.* TO '${ADMIN_USER}'@'%';"
mysql -u ${ADMIN_USER} --password=${DB_PASS} -e "FLUSH PRIVILEGES;"