FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	php-mysql \
	php-mbstring \
	php7.3-fpm \
	wget

RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xvf latest.tar.gz -C /var/www/html/

COPY wp-config.php /var/www/html/wordpress
