FROM jgoerzen/debian-base-security:stretch
MAINTAINER John Goerzen <jgoerzen@complete.org>
RUN mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d
RUN apt-get update && \
    apt-get -y --no-install-recommends install lame faad sox flac wavpack libio-socket-ssl-perl libgomp1 && \
    apt-get -y -u dist-upgrade && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY setup/ /tmp/setup/
RUN /tmp/setup/setup.sh
RUN /usr/local/bin/docker-wipelogs
RUN mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled

EXPOSE 3483 9090 9000 1900/udp 3483/udp
VOLUME ["/var/lib/squeezeboxserver/prefs"]
CMD ["/usr/local/bin/boot-debian-base"]

