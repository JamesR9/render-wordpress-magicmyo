# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
#FROM wordpress:6.1.1-php8.1-apache
FROM wordpress:latest
#FROM wordpress:5.3.2-apache
#FROM wordpress:5.3.2-php7.4-apache
# APT Update/Upgrade, then install packages we need
RUN apt update && \
    apt upgrade -y && \
    apt autoremove && \
    apt install -y \
    vim \
    wget \
    mariadb-client

# Replace php.ini
COPY php.ini /usr/local/etc/php

# Install WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    php wp-cli.phar --info&& \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    # Remove old php.ini files (wihtout creating new image)
    rm /usr/local/etc/php/php.ini-development && \
    rm /usr/local/etc/php/php.ini-production


#RUN apt-get update && apt-get install -y magic-wormhole

#RUN usermod -s /bin/bash www-data
#RUN chown www-data:www-data /var/www/html
#USER www-data:www-data

