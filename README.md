caching-proxy
=============

Caching proxy server to reduce network load for building/starting containers.

In the current incarnation it is hideously insecure.  *Use behind a firewall!*

Once it is built, run like:

    docker run -i -t -p 8080:8080 -v /home/core/cache:/cache caching-proxy /bin/bash

