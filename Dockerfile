FROM jgoerzen/debian-base-security:stretch
MAINTAINER John Goerzen <jgoerzen@complete.org>
RUN mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d
COPY setup/ /tmp/setup/
RUN /tmp/setup/setup.sh
RUN apt-get update && \
RUN apt-get -y --no-install-recommends install lame faad sox flac wavpack \
    apt-get -y -u dist-upgrade && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN cd /var/www/html/ampache && \
    mkdir lib/vendor lib/components && \
    chown www-data lib/vendor lib/components && \
    su www-data -s /bin/bash -c 'composer install --prefer-source --no-interaction' && \
    chown -R root:root /var/www/html/ampache
COPY 99-ampache.ini /etc/php/7.0/apache2/conf.d/
RUN a2enmod rewrite && \
    a2enmod ssl && \
    ln -s html/ampache /var/www/ampache
# Mark things writable.  This list is in lib/debug.lib.php
# For auto-update to work, the entire thing has to be owned by www-data
RUN chown -R www-data /var/www/html/ampache/config && \
    for FILE in channel rest play; do \
      chown www-data /var/www/html/ampache/$FILE; \
      chown www-data /var/www/html/ampache/$FILE/.htaccess || true; \
      done
RUN /usr/local/bin/docker-wipelogs
RUN mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

EXPOSE 80 443 81
VOLUME ["/var/www/html/ampache/config"]
CMD ["/usr/local/bin/boot-debian-base"]

