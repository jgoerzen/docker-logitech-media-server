FROM jgoerzen/debian-base-apache-php
MAINTAINER John Goerzen <jgoerzen@complete.org>
RUN mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d
RUN apt-get update && \
    apt-get -y --no-install-recommends install php7.0-mysql php-xml \
        php-json php-curl \
        libav-tools ffmpeg php-gd git timidity && \
    apt-get -y -u dist-upgrade && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY setup/ /tmp/setup/
RUN /tmp/setup/setup.sh
RUN cd /var/www/ampache && \
    mkdir lib/vendor lib/components && \
    chown www-data lib/vendor lib/components && \
    su www-data -s /bin/bash -c 'composer install --prefer-source --no-interaction' && \
    chown -R root:root /var/www/ampache
RUN a2enmod rewrite && \
    a2enmod ssl
# Mark things writable.  This list is in lib/debug.lib.php
# For auto-update to work, the entire thing has to be owned by www-data
RUN chown -R www-data /var/www/ampache/config && \
    for FILE in channel rest play; do \
      chown www-data /var/www/ampache/$FILE; \
      chown www-data /var/www/ampache/$FILE/.htaccess || true; \
      done
RUN /usr/local/bin/docker-wipelogs
RUN mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

EXPOSE 80 443 81
CMD ["/usr/local/bin/boot-debian-base"]

