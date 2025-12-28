FROM alpine:3.22

RUN apk add mariadb mariadb-client
RUN mkdir -p /var/lib/mysql /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

COPY configs/my.cnf /etc/my.cnf

COPY scripts/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--init-file=/tmp/init.sql"]