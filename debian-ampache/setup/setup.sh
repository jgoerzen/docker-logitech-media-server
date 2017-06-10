#!/bin/bash

set -e
set -x

cd /tmp/setup
/tmp/setup/getcomposer.sh

wget https://github.com/ampache/ampache/archive/3.8.2.tar.gz
sha256sum -c < sums

cd /var/www
tar -zxvf /tmp/setup/3.8.2.tar.gz

exec rm -rf /tmp/setup

