#!/bin/sh

set -o errexit

echo "Start building"

export BUILD_COMPLETE_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
export BUILD_DATE=$(date -u +'%Y.%m.%d')
export BUILD_SOURCE_CONTROL_REVISION=$(git rev-parse HEAD)

echo "Building Ubuntu 18.04"
docker build \
    --tag android-aosp-build:ubuntu-18.04 \
    --file ./images/ubuntu/Dockerfile_18_04 \
    --label "org.opencontainers.image.version=ubuntu-18.04-$BUILD_COMPLETE_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_SOURCE_CONTROL_REVISION" \
    --label "org.opencontainers.image.created=$BUILD_COMPLETE_DATE" \
    ./images/ubuntu

echo "Building Ubuntu 14.04"
docker build \
    --tag android-aosp-build:ubuntu-14.04 \
    --file ./images/ubuntu/Dockerfile_14_04 \
    --label "org.opencontainers.image.version=ubuntu-14.04-$BUILD_COMPLETE_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_SOURCE_CONTROL_REVISION" \
    --label "org.opencontainers.image.created=$BUILD_COMPLETE_DATE" \
    ./images/ubuntu

echo "Building Ubuntu 12.04"
docker build \
    --tag android-aosp-build:ubuntu-12.04 \
    --file ./images/ubuntu/Dockerfile_12_04 \
    --label "org.opencontainers.image.version=ubuntu-12.04-$BUILD_COMPLETE_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_SOURCE_CONTROL_REVISION" \
    --label "org.opencontainers.image.created=$BUILD_COMPLETE_DATE" \
    ./images/ubuntu

echo "Building Ubuntu 10.04"
docker build \
    --tag android-aosp-build:ubuntu-10.04 \
    --file ./images/ubuntu/Dockerfile_10_04 \
    --label "org.opencontainers.image.version=ubuntu-10.04-$BUILD_COMPLETE_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_SOURCE_CONTROL_REVISION" \
    --label "org.opencontainers.image.created=$BUILD_COMPLETE_DATE" \
    ./images/ubuntu

echo "Building Archlinux"
docker build \
    --tag android-aosp-build:archlinux \
    --label "org.opencontainers.image.version=archlinux-$BUILD_COMPLETE_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_SOURCE_CONTROL_REVISION" \
    --label "org.opencontainers.image.created=$BUILD_COMPLETE_DATE" \
    ./images/archlinux

echo "Building finished"

docker tag android-aosp-build:ubuntu-18.04 android-aosp-build:latest
