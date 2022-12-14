#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

#FROM php:8.0-alpine

# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:6.1.1-php8.1-apache

RUN apt-get update && apt-get install -y magic-wormhole

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www
RUN chown -R www-data:www-data uploads/*
RUN chmod 755 uploads/*
USER www-data:www-data

