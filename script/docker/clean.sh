#!/bin/sh -e

script/docker/remove.sh

# Remove image.
docker rmi funtimecoding/perl-utility

# Remove dangling image identifiers, and more.
docker system prune
