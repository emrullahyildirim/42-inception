#!/bin/sh

WP_PATH="${WP_PATH:-/var/www/html}"

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

exec "$@"
