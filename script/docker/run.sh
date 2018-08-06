#!/bin/sh -e

# Development mode mounts the project root so it can be edited and re-ran without rebuilding the image and recreating the container.

if [ "${1}" = --development ]; then
    DEVELOPMENT=true
else
    DEVELOPMENT=false
fi

docker ps --all | grep --quiet perl-utility && FOUND=true || FOUND=false

if [ "${FOUND}" = false ]; then
    if [ "${DEVELOPMENT}" = true ]; then
        docker create --name perl-utility --volume $(pwd):/perl-utility funtimecoding/perl-utility
    else
        docker create --name perl-utility funtimecoding/perl-utility
    fi

    # TODO: Specifying the entry point overrides CMD in Dockerfile. Is this useful, or should all sub commands go through one entry point script? I'm inclined to say one entry point script per project.
    #docker create --name perl-utility --volume $(pwd):/perl-utility --entrypoint /perl-utility/bin/other.sh funtimecoding/perl-utility
    #docker create --name perl-utility funtimecoding/perl-utility /perl-utility/bin/other.sh
    # TODO: Run tests this way?
    #docker create --name perl-utility funtimecoding/perl-utility /perl-utility/script/docker/test.sh
fi

docker start --attach perl-utility
