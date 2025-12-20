FROM alpine:3.20

RUN apk update
RUN apk add nginx=1.26.3-r0 openssl=3.3.5-r0

RUN mkdir -p /etc/nginx/ssl

COPY ./scripts/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
COPY ./configs/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 443

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;"]