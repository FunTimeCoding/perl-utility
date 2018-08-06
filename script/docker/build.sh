#!/bin/sh -e

docker images | grep --quiet funtimecoding/perl-utility && FOUND=true || FOUND=false

if [ "${FOUND}" = true ]; then
    docker rmi funtimecoding/perl-utility
fi

docker build --tag funtimecoding/perl-utility .
