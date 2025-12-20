#!/bin/sh
set -e

WP_PATH="${WP_PATH:-/var/www/html}"

# Ensure WordPress core exists in the expected path
if [ ! -f "$WP_PATH/wp-settings.php" ]; then
    echo "WordPress not found in $WP_PATH — downloading..."
    wp core download --path="$WP_PATH" --allow-root
fi

# Create wp-config.php only if it doesn't exist
if [ ! -f "$WP_PATH/wp-config.php" ]; then
    wp config create \
        --path="$WP_PATH" \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="${MYSQL_HOST}" \
        --skip-check \
        --allow-root
fi

exec "$@"
