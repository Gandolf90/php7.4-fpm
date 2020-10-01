####################################
#    Gandolf90 PHP 7.4 FPM image   #
####################################

FROM phpdockerio/php74-cli

# Install selected extensions and other stuff
RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.4-fpm php7.4-mysql php7.4-intl php7.4-mbstring php7.4-sqlite3 nano\
    && apt-get clean; 
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

STOPSIGNAL SIGQUIT

COPY overrides.conf /etc/php/7.4/fpm/pool.d/z-overrides.conf

WORKDIR "/var/www/"

RUN chown -R www-data:www-data "/var/www/"
RUN chmod -R 0755 "/var/www/"

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-O" ]