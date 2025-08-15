FROM debian:bullseye
 
RUN apt update -y && apt install -y php php-fpm php-mysql curl

COPY ./tools/wordpress.sh /tmp/

RUN chmod +x /tmp/wordpress.sh

RUN mkdir -p /run/php

ENTRYPOINT ["./tmp/wordpress.sh"]

CMD ["php-fpm7.4", "-F"]