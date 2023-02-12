FROM debian:buster

RUN apt-get update && apt-get install -y wget php php-mysql \
	&& wget -O /var/www/html/index.php https://www.adminer.org/latest.php \
	&& chown -R www-data:www-data /var/www/html/index.php
RUN chmod -755 /var/www/html/index.php

WORKDIR /var/www/html
RUN rm -rf /var/lib/apt/lists/* index.html
EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000"]