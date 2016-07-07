#!/bin/bash

if [[ "$1" == "" ]]; then
	echo "Usage: $0 ssl_directory cache_directory"
	exit 1
fi

SSL_DIRECTORY="$1"
CACHE_DIRECTORY="$2"

docker run -d --restart=always -p 443:443 --name registry-cache \
	-v ${SSL_DIRECTORY}:/etc/ssl/private \
	-v ${CACHE_DIRECTORY}/cache \
	registry-cache:latest
