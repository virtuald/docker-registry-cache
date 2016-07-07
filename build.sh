#!/bin/bash -e

cd $(dirname $0)

if [[ ! -f squid.conf ]]; then
    echo "You must copy squid.conf.template AND modify it! See README.md"
    exit 1
fi

if [[ "$(grep -c '{{ docker_host }}' squid.conf)" != "0" ]]; then
    echo "You must change {{ docker_host }} in squid.conf"
    exit 1
fi

if [[ "$(grep -c '{{ cache_size }}' squid.conf)" != "0" ]]; then
    echo "You must change {{ cache_size }} in squid.conf"
    exit 1
fi

cp build-squid/squid-common*.deb squid-common.deb
cp build-squid/squid_*.deb squid.deb

docker build -t registry-cache:latest .
