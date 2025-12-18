FROM alpine:3.20

RUN apk update
RUN apk add nginx=1.26.3-r0

COPY ./configs/nginx.conf /etc/nginx/http.d/default.conf

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;"]