FROM alpine:3.22

RUN apk add \
    php82 php82-fpm php82-opcache php82-gd php82-mysqli php82-zlib \
    php82-curl php82-phar php82-json php82-mbstring php82-xml \
    wget tar

COPY ./configs/www.conf /etc/php82/php-fpm.d/www.conf
COPY ./scripts/docker-entrypoint.sh /usr/local/bin/
	
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN ln -sf /usr/bin/php82 /usr/bin/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp \
	&& chmod +x /usr/local/bin/wp

RUN mkdir -p /var/www/html \
	&& chown -R nobody:nobody /var/www/html \
	&& chmod -R 755 /var/www/html

RUN wget https://wordpress.org/latest.tar.gz -O latest.tar.gz \
	&& tar --strip-components=1 -xzf latest.tar.gz -C /var/www/html \
	&& rm latest.tar.gz

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["php-fpm82", "-F"]



