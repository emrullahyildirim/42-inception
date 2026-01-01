#!/bin/sh

set -e

WP_PATH="${WP_PATH:-/var/www/html}"

ADMIN_PASSWORD_FILE="/run/secrets/wp_admin_password"
SITE_USER_PASSWORD_FILE="/run/secrets/wp_user_password"
DB_PASSWORD_FILE="/run/secrets/db_user_password"

if [ -f "$ADMIN_PASSWORD_FILE" ]; then
	ADMIN_PASSWORD=$(cat "$ADMIN_PASSWORD_FILE")
else
	echo "Admin password file not found!"
	exit 1
fi

if [ -f "$SITE_USER_PASSWORD_FILE" ]; then
	SITE_USER_PASSWORD=$(cat "$SITE_USER_PASSWORD_FILE")
else
	echo "Site user password file not found!"
	exit 1
fi

if [ -f "$DB_PASSWORD_FILE" ]; then
	DB_PASSWORD=$(cat "$DB_PASSWORD_FILE")
else
	echo "Database user password file not found!"
	exit 1
fi

if [ ! -f "$WP_PATH/wp-settings.php" ]; then
    wp core download --path="$WP_PATH" --allow-root
fi

if [ ! -f "$WP_PATH/wp-config.php" ]; then
    wp config create \
        --path="$WP_PATH" \
        --dbname="${DB_NAME}" \
        --dbuser="${DB_USER}" \
        --dbpass="${DB_PASSWORD}" \
        --dbhost="${DB_HOST}" \
        --skip-check \
        --allow-root

	wp core install \
		--path="$WP_PATH" \
		--url="${SITE_URL}" \
		--title="${SITE_TITLE}" \
		--admin_user="${ADMIN_USERNAME}" \
		--admin_password="${ADMIN_PASSWORD}" \
		--admin_email="${ADMIN_EMAIL}" \
		--skip-email \
		--allow-root

	wp user create ${SITE_USER} ${SITE_USER_EMAIL} \
		--user_pass=${SITE_USER_PASSWORD} \
		--role=editor \
		--path="$WP_PATH" \
		--allow-root
fi


unset ADMIN_PASSWORD
unset SITE_USER_PASSWORD
unset DB_PASSWORD

exec "$@"
