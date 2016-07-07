#!/bin/bash
# Inspired by docker-squid

if [[ ! -d /cache/cc ]]; then
    mkdir /cache/cc
    chown proxy:proxy /cache/cc
    /usr/sbin/squid3 -N -z
fi

echo "Starting squid..."
/usr/sbin/squid3 -NYCd 1