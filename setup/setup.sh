#!/bin/bash

set -e
set -x

cd /tmp/setup
# See http://downloads.slimdevices.com/
wget http://downloads.slimdevices.com/LogitechMediaServer_v7.9.1/logitechmediaserver_7.9.1_amd64.deb
sha256sum -c < sums
dpkg -i logitechmediaserver_7.9.1_amd64.deb
cd /
rm -rf /tmp/setup

# Delete the annoying bits from earlier Perls.
for ASDF in 5.8 5.10 5.12 5.14 5.16 5.18 5.20 5.22; do
         rm -r /usr/share/squeezeboxserver/CPAN/arch/$ASDF
done

