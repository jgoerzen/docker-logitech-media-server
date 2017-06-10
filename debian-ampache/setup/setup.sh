#!/bin/bash

set -e
set -x

cd /tmp/setup
/tmp/setup/getcomposer.sh
mv -vi composer.phar /usr/local/bin/composer

wget https://github.com/ampache/ampache/archive/3.8.2.tar.gz
sha256sum -c < sums

cd /var/www/html
tar -zxvf /tmp/setup/3.8.2.tar.gz
mv ampache-3.8.2 ampache

exec rm -rf /tmp/setup

