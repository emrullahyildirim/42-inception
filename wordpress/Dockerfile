FROM alpine:3.20

RUN apk add --no-cache \
	php82 \
	php82-fpm \
	php82-opcache \
	php82-gd \
	php82-mysqli \
	php82-zlib \
	php82-curl \
	php82-phar \
	php82-json \
	php82-mbstring \
	php82-xml \
	wget \
	tar

COPY ./configs/www.conf /etc/php82/php-fpm.d/www.conf

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz -O latest.tar.gz \
    && tar -xzf latest.tar.gz \
    && mv wordpress/* . \
    && rm -rf wordpress latest.tar.gz


EXPOSE 9000

CMD ["php-fpm82", "-F"]
