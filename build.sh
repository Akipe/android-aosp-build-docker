#!/bin/sh

set -o errexit

echo "Start building"

export BUILD_DATE_RFC3339=$(date --rfc-3339=date)
export BUILD_DATE=$(date -u +'%Y.%m.%d')
export BUILD_COMMIT_HASH=$(git rev-parse HEAD)

echo "*************************************"
echo "****  Building base system   ********"
echo "*************************************"

echo "Building Archlinux base" && \
docker build \
    --label "org.opencontainers.image.version=archlinux-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build-base:archlinux \
    ./images/archlinux && \
echo "Building Ubuntu 10.04 base" && \
docker build \
    --file ./images/ubuntu/Dockerfile_10_04 \
    --label "org.opencontainers.image.version=ubuntu-10.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build-base:ubuntu-10.04 \
    ./images/ubuntu && \
echo "Building Ubuntu 12.04 base" && \
docker build \
    --file ./images/ubuntu/Dockerfile_12_04 \
    --label "org.opencontainers.image.version=ubuntu-12.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build-base:ubuntu-12.04 \
    ./images/ubuntu && \
echo "Building Ubuntu 18.04 base" && \
docker build \
    --file ./images/ubuntu/Dockerfile_18_04 \
    --label "org.opencontainers.image.version=ubuntu-18.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build-base:ubuntu-18.04 \
    ./images/ubuntu && \
echo "Building Ubuntu 14.04 base" && \
docker build \
    --file ./images/ubuntu/Dockerfile_14_04 \
    --label "org.opencontainers.image.version=ubuntu-14.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build-base:ubuntu-14.04 \
    ./images/ubuntu

echo "*************************************"
echo "**  Building for Android versions   *"
echo "*************************************"

echo "Building Android 7.0 to 8.0 (Archlinux)" && \
docker build \
    --file ./images/android/Dockerfile_7_8_archlinux \
    --label "org.opencontainers.image.version=android-7-8-archlinux-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-7-archlinux \
    --tag android-aosp-build:android-8-archlinux \
    ./images/android && \
echo "Building Android 9.0 to latest (Archlinux)" && \
docker build \
    --file ./images/android/Dockerfile_9_latest_archlinux \
    --label "org.opencontainers.image.version=android-9-latest-archlinux-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-9-archlinux \
    --tag android-aosp-build:android-10-archlinux \
    --tag android-aosp-build:android-11-archlinux \
    --tag android-aosp-build:android-12-archlinux \
    --tag android-aosp-build:android-13-archlinux \
    ./images/android && \
echo "Building Android 1.5 to 2.2.x (Ubuntu 10.04)" && \
docker build \
    --file ./images/android/Dockerfile_1_2_ubuntu_10_04 \
    --label "org.opencontainers.image.version=android-1.5-2.2-ubuntu-10.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-2.2 \
    --tag android-aosp-build:android-2.2-ubuntu-10.04 \
    --tag android-aosp-build:android-2.1 \
    --tag android-aosp-build:android-2.1-ubuntu-10.04 \
    --tag android-aosp-build:android-2.0 \
    --tag android-aosp-build:android-2.0-ubuntu-10.04 \
    --tag android-aosp-build:android-1.6 \
    --tag android-aosp-build:android-1.6-ubuntu-10.04 \
    --tag android-aosp-build:android-1.5 \
    --tag android-aosp-build:android-1.5-ubuntu-10.04 \
    ./images/android && \
echo "Building Android 2.3.x to 4.4.x (Ubuntu 12.04)" && \
docker build \
    --file ./images/android/Dockerfile_2_4_ubuntu_12_04 \
    --label "org.opencontainers.image.version=android-2.3-4.4-ubuntu-12.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-4 \
    --tag android-aosp-build:android-4-ubuntu-12.04 \
    --tag android-aosp-build:android-2.3 \
    --tag android-aosp-build:android-2.3-ubuntu-12.04 \
    ./images/android && \
echo "Building Android 5.0 (Ubuntu 12.04)" && \
docker build \
    --file ./images/android/Dockerfile_5_ubuntu_12_04 \
    --label "org.opencontainers.image.version=android-5-ubuntu-18.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-5 \
    --tag android-aosp-build:android-5-ubuntu-12.04 \
    ./images/android && \
echo "Building Android 6.0 (Ubuntu 14.04)" && \
docker build \
    --file ./images/android/Dockerfile_6_ubuntu_14_04 \
    --label "org.opencontainers.image.version=android-6-ubuntu-14.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-6 \
    --tag android-aosp-build:android-6-ubuntu-14.04 \
    ./images/android && \
echo "Building Android 7.0 to 8.0 (Ubuntu 18.04)" && \
docker build \
    --file ./images/android/Dockerfile_7_8_ubuntu_18_04 \
    --label "org.opencontainers.image.version=android-7-8-ubuntu-18.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-7-ubuntu-18.04 \
    --tag android-aosp-build:android-8-ubuntu-18.04 \
    ./images/android && \
echo "Building Android 7.0 to 8.0 (Ubuntu 14.04)" && \
docker build \
    --file ./images/android/Dockerfile_7_8_ubuntu_14_04 \
    --label "org.opencontainers.image.version=android-7-8-ubuntu-14.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-7 \
    --tag android-aosp-build:android-7-ubuntu-14.04 \
    --tag android-aosp-build:android-8 \
    --tag android-aosp-build:android-8-ubuntu-14.04 \
    ./images/android && \
echo "Building Android 9.0 to latest (Ubuntu 18.04)" && \
docker build \
    --file ./images/android/Dockerfile_9_latest_ubuntu_18_04 \
    --label "org.opencontainers.image.version=android-9-latest-ubuntu-18.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-9-ubuntu-18.04 \
    --tag android-aosp-build:android-10-ubuntu-18.04 \
    --tag android-aosp-build:android-11-ubuntu-18.04 \
    --tag android-aosp-build:android-12-ubuntu-18.04 \
    --tag android-aosp-build:android-13-ubuntu-18.04 \
    ./images/android && \
echo "Building Android 9.0 to latest (Ubuntu 14.04)" && \
docker build \
    --file ./images/android/Dockerfile_9_latest_ubuntu_14_04 \
    --label "org.opencontainers.image.version=android-9-latest-ubuntu-14.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-9 \
    --tag android-aosp-build:android-9-ubuntu-14.04 \
    --tag android-aosp-build:android-10 \
    --tag android-aosp-build:android-10-ubuntu-14.04 \
    --tag android-aosp-build:android-11 \
    --tag android-aosp-build:android-11-ubuntu-14.04 \
    --tag android-aosp-build:android-12 \
    --tag android-aosp-build:android-12-ubuntu-14.04 \
    --tag android-aosp-build:android-13 \
    --tag android-aosp-build:android-13-ubuntu-14.04 \
    --tag android-aosp-build:latest \
    ./images/android && \
echo "Building finished"
