# Ampache Music Server

This is a set of images that make it simple to serve up your
music collection with [Ampache](http://www.ampache.org).  They run on top
of my [Debian base system](http://github.com/jgoerzen/docker-debian-base),
which provides excellent logging capabilities.

This image provides the Ampache server, with full support for transcoding
on the fly.

I provide two images: jgoerzen/ampache, which is designed to be used
with an outside MySQL/MariaDB server, and jgoerzen/ampache-mysql,
which includes an embedded MariaDB server in the image for very easy setup.

You can download with:

    docker pull jgoerzen/ampache-mysql

And run with something like this:

    docker run -td -p 8080:80 -p 80443:443 --stop-signal=SIGPWR \
    -v /musicdir:/music:ro \
    -v /playlistdir:/playlists:rw \
    --name=ampache jgoerzen/ampache-mysql

(Omit the `-mysql` from both commands if you have a MySQL server elsewhere that you
will connect to.)

This will expose your music stored at `/musicdir` on the host in read-only mode, and your playlists
stored at `/playlistdir` in read-write mode, to the container.  You will probably also
want to add a `-v` in some fashion covering `/var/www/html/ampache/config`, since that you will want
to preserve those files as well.

# Setup

Now, point a browser at http://localhost:8080/ampache and follow the
on-screen steps, using the [Ampache install docs](https://github.com/ampache/ampache/wiki/Installation)
as a guide.

If you are using the built-in MySQL/MariaDB server, use these values:

 - Database name: ampache
 - MySQL hostname: localhost
 - MySQL port: blank
 - MySQL username: ampache
 - MySQL password: ampache

# Ports

By default, this image exposes a HTTP server on port 80, HTTPS on port 443, and
also exposes port 81 in case you wish to use it separately for certbot or another
Letsencrypt validation system.  HTTPS will require additional configuration.

Ampache is exposed at path `/ampache` on the configured system. 

# Source

This is prepared by John Goerzen <jgoerzen@complete.org> and the source
can be found at https://github.com/jgoerzen/docker-ampache

# Security Status

The Debian operating system is configured to automatically apply security patches.
Ampache, however, does not have such a feature, nor do most of the third-party
PHP modules it integrates.

# Copyright

Docker scripts, etc. are
Copyright (c) 2017 John Goerzen
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of the University nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

Additional software copyrights as noted.

