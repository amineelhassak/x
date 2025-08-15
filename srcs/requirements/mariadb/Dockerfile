FROM debian:bullseye

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /script.sh

RUN chmod +x /script.sh

ENTRYPOINT ["./script.sh"]
CMD ["mysqld_safe"]