#!/bin/bash
set -e

echo "Starting identidock system..."
docker run -d --restart=always --name redis redis:3
docker run -d --restart=always --name dnmonster amouat/dnmonster:1.0
docker run -d --restart=always --link dnmonster:dnmonster --link redis:redis -e ENV=PROD --name identidock m0stwan1ed/identidock:1.0
docker run -d --restart=always --name proxy --link identidock:identidock -p 80:80 -e NGINX_HOST=127.0.0.1 -e NGINX_PROXY=http://identidock:9090 m0stwan1ed/proxy:1.0

echo "Started!"