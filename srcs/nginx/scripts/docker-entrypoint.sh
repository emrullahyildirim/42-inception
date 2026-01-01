#!/bin/sh

set -e

if [ ! -f /etc/nginx/ssl/nginx.crt ]; then
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=TR/ST=ISTANBUL/L=SARIYER/O=42ISTANBUL/CN=emyildir.42.fr";
fi

exec "$@"