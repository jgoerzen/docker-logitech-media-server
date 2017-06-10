#!/bin/bash

set -e
set -x

cd /tmp/setup
/tmp/setup/getcomposer.sh
mv -vi composer.phar /usr/local/bin/composer

cd /var/www/html
git clone https://github.com/ampache/ampache.git
cd ampache
git checkout master

exec rm -rf /tmp/setup

