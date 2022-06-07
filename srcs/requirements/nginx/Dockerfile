FROM debian:buster

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
	    nginx \
	    curl \
	    openssl

RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=bahn/CN=localhost" \
	-keyout openssl_rsa4096.key \
	-out openssl_x509.crt
RUN	mv openssl_rsa4096.key etc/ssl/private/
RUN mv openssl_x509.crt etc/ssl/certs/
RUN chmod 600 etc/ssl/private/openssl_rsa4096.key etc/ssl/certs/openssl_x509.crt

# COPY ./srcs/initialize.sh /copy/
COPY default /etc/nginx/sites-available/

EXPOSE 80 443

# CMD bash ./copy/initialize.sh
