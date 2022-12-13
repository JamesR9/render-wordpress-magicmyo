# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
#FROM wordpress:6.1.1-php8.1-apache
FROM wordpress:5.3.2-apache
#FROM wordpress:5.3.2-php7.4-apache
#RUN apt-get update && apt-get install -y magic-wormhole \
#		cp -s wp-config-docker.php wp-config.php
#RUN set -eux; \
#	find /etc/apache2 -name '*.conf' -type f -exec sed -ri -e "s!/var/www/html!$PWD!g" -e "s!Directory /var/www/!Directory $PWD!g" '{}' +; \
#	cp -s wp-config-docker.php wp-config.php
#WORKDIR /var/www/html	

#COPY plugins /var/www/html/wp-content/plugins
#COPY wp-content/ ./wp-content
#COPY custom.ini $PHP_INI_DIR/conf.d/

#COPY plugins /var/www/html/wp-content/plugins
#COPY themes /var/www/html/wp-content/themes
#COPY uploads /var/www/html/wp-content/uploads
RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www/html
USER www-data:www-data


COPY twentyninetine /var/www/html/wp-content/themes/twentyninetine
