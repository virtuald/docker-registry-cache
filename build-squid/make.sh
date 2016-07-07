#!/bin/bash -e

cd $(dirname $0)
docker run  -it -v $(pwd):/source -v /build  ubuntu:16.04 /source/_make.sh

