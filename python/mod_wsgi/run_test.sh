#!/bin/sh

mod_wsgi-express start-server --help
mod_wsgi-express start-server --server-root ./testserver --port 9000 &
sleep 5
wget http://localhost:9000 --no-proxy
./testserver/apachectl stop
