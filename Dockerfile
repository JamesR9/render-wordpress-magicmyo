# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:5.7.2-php8.0-apache
#FROM wordpress:5.3.2-php7.4-apache
#RUN apt-get update && apt-get install -y magic-wormhole
WORKDIR /usr/src/wordpress
RUN set -eux; \
	find /etc/apache2 -name '*.conf' -type f -exec sed -ri -e "s!/var/www/html!$PWD!g" -e "s!Directory /var/www/!Directory $PWD!g" '{}' +; \
	cp -s wp-config-docker.php wp-config.php
VOLUME /var/www/html
COPY custom-theme/ ./wp-content/themes/custom-theme/
COPY custom-plugin/ ./wp-content/plugins/custom-plugin/
COPY custom.ini $PHP_INI_DIR/conf.d/

#COPY plugins/ /var/www/html/wp-content/plugins
#COPY themes/ /var/www/html/wp-content/themes
#COPY uploads/ /var/www/html/wp-content/uploads
RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www
USER www-data:www-data
