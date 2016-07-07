#!/bin/bash -e

cd /build

apt-get update
apt-get install -y build-essential fakeroot devscripts libssl-dev
apt-get build-dep -y squid

apt-get source squid

cd squid3*
patch -p0 < /source/rules.patch

debuild -us -uc -i -I

cd ..
cp *.deb /source
