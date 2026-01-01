#!/bin/sh

set -e

MYSQL_ROOT_PASSWORD_FILE="/run/secrets/db_root_password"
DB_USER_PASSWORD_FILE="/run/secrets/db_user_password"

if [ -f "$MYSQL_ROOT_PASSWORD_FILE" ]; then
	MYSQL_ROOT_PASSWORD=$(cat "$MYSQL_ROOT_PASSWORD_FILE")
else
	echo "Database root password file not found!"
	exit 1
fi

if [ -f "$DB_USER_PASSWORD_FILE" ]; then
	DB_PASSWORD=$(cat "$DB_USER_PASSWORD_FILE")
else
	echo "Database user password file not found!"
	exit 1
fi

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;" > /tmp/init.sql


unset MYSQL_ROOT_PASSWORD
unset DB_PASSWORD

exec "$@"
