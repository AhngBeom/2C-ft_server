FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	    mariadb-server \
		mariadb-client

RUN service mysql start
RUN echo "CREATE DATABASE IF NOT EXISTS wordpress;"	| mysql -u root -S /var/run/mysqld/mysqld.sock
RUN echo "CREATE USER IF NOT EXISTS 'bahn'@'localhost' IDENTIFIED BY '1234';"  | mysql -u root -S /var/run/mysqld/mysqld.sock
RUN echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'bahn'@'localhost' WITH GRANT OPTION;" | mysql -u root -S /var/run/mysqld/mysqld.sock

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin 
RUN	mv phpmyadmin /var/www/html/ 

COPY config.inc.php /var/www/html/phpmyadmin/

RUN chown -R www-data:www-data /var/www/
RUN chmod -R +x /var/www/

RUN service nginx start
RUN service php7.3-fpm start
RUN service mysql restart