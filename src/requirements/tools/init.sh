#!/bin/bash

source .env

# Start the MariaDB service
service mysql start

# Create a new database
mysql -e "CREATE DATABASE ${MDB_NAME};"

# Create a new user and grant permissions
mysql -e "CREATE USER '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASS}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MDB_NAME}.* TO '${MDB_USER}'@'%';"

# Flush the privileges
mysql -e "FLUSH PRIVILEGES;"

# Create admin user
mysql -u ${ADMIN_USER} -p${ADMIN_PASS} -e "CREATE USER '${ADMIN_USER}'@'%' IDENTIFIED BY '${ADMIN_PASS}';"
mysql -u ${ADMIN_USER} -p${ADMIN_PASS} -e "GRANT ALL PRIVILEGES ON *.* TO '${ADMIN_USER}'@'%';"
mysql -u ${ADMIN_USER} -p${ADMIN_PASS} -e "FLUSH PRIVILEGES;"
# service mysql start
# mysql -e "CREATE DATABASE '${MDB_NAME}';"
# mysql -e "CREATE USER '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_PASS}';"
# mysql -e "GRANT ALL PRIVILEGES ON ${MDB_NAME}.* TO '${DB_USER}'@'%';"
# mysql -e "FLUSH PRIVILEGES;"
# mysql -e "ALTER USER '${ADMIN_USER}'@'localhost' IDENTIFIED BY '${MDB_PASS}'"