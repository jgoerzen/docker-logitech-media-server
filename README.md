# Ampache Music Server

This is an image that makes it simple to serve up your
music collection with the [Logitech Media Server](https://en.wikipedia.org/wiki/Logitech_Media_Server), which
is also known as Slimserver and Squeezebox Server.  Many people will
use [Squeezelite](https://en.wikipedia.org/wiki/Squeezelite) as a client for it.
 [Ampache](http://www.ampache.org).  They run on top
of my [Debian base system](http://github.com/jgoerzen/docker-debian-base),
which provides excellent logging capabilities.

This image provides the server, with full support for transcoding
on the fly.

You can download with:

    docker pull jgoerzen/ampache-mysql

And run with something like this:

    docker run -td -P --stop-signal=SIGPWR \
    -v /musicdir:/music:ro \
    -v /playlistdir:/playlists:rw \
    --name=ampache jgoerzen/logitech-media-server

This will expose your music stored at `/musicdir` on the host in read-only mode, and your playlists
stored at `/playlistdir` in read-write mode, to the container.  You will probably also
want to add a `-v` in some fashion covering `/var/lib/squeezeboxserver/prefs`, since that you will want
to preserve those files as well.

Now, connect to http://localhost:9000/ to configure the system.

Once configured, add a catalog pointing to `/music` and set your playlist directory to `/playlists`.

# Ports

By default, this image exposes a HTTP server on port 80, HTTPS on port 443, and
also exposes port 81 in case you wish to use it separately for certbot or another
Letsencrypt validation system.  HTTPS will require additional configuration.

# Source

This is prepared by John Goerzen <jgoerzen@complete.org> and the source
can be found at https://github.com/jgoerzen/docker-logitech-media-server

# Security Status

The Debian operating system is configured to automatically apply security patches.
Logitech Media Server, however, does not have such a feature, nor do most of the third-party
Perl modules it integrates.

# Links

 - [Download page](http://downloads.slimdevices.com/)
 - [Home page](http://wiki.slimdevices.com/index.php/SlimServer)


# Tags

These Docker tags are defined:

 - latest is built against the Ampache github master branch (which they recommend)
 - Other branches use the versioned tarballs

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

