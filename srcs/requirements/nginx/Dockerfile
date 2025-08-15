FROM debian:bullseye

RUN apt update && apt install -y openssl nginx

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/amine.key \
    -out /etc/nginx/ssl/amine.crt -sha256 -days 365 -nodes \
    -subj "/C=MA/ST=Fes/L=Fes/O=1337/OU=1337/CN=amel-has.42.fr"

COPY ./conf/config.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]