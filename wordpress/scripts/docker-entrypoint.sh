#!/bin/sh
set -e

WP_PATH="${WP_PATH:-/var/www/html}"

if [ ! -f "$WP_PATH/wp-settings.php" ]; then
    wp core download --path="$WP_PATH" --allow-root
fi

if [ ! -f "$WP_PATH/wp-config.php" ]; then
    wp config create \
        --path="$WP_PATH" \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="${MYSQL_HOST}" \
        --skip-check \
        --allow-root
	wp core install \
		--path="$WP_PATH" \
		--url="${WORDPRESS_URL}" \
		--title="${WORDPRESS_TITLE}" \
		--admin_user="${WORDPRESS_ADMIN_USER}" \
		--admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
		--admin_email="${WORDPRESS_ADMIN_EMAIL}" \
		--skip-email \
		--allow-root
fi

exec "$@"
