#!/bin/sh -e

rm -rf build
script/check.sh --ci-mode
script/test.sh --ci-mode
# TODO: Finish implementation, then uncomment.
#script/docker/build.sh
