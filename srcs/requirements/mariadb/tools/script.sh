#!/bin/bash

service mariadb start
sleep 15

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO \`${DB_USER}\`@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -u root -p"${DB_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

exec "$@"