#!/bin/sh

set -o errexit

echo "Start building"

export BUILD_DATE_RFC3339=$(date --rfc-3339=date)
export BUILD_DATE=$(date -u +'%Y.%m.%d')
export BUILD_COMMIT_HASH=$(git rev-parse HEAD)

echo "Building for Android 9.0 to 13.0 (Ubuntu 18.04)" && \
docker build \
    --file ./images/ubuntu/Dockerfile_18_04 \
    --label "org.opencontainers.image.version=ubuntu-18.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:ubuntu-18.04 \
    --tag android-aosp-build:android-9-ubnt-18.04 \
    --tag android-aosp-build:android-10-ubnt-18.04 \
    --tag android-aosp-build:android-11-ubnt-18.04 \
    --tag android-aosp-build:android-12-ubnt-18.04 \
    --tag android-aosp-build:android-13-ubnt-18.04 \
    ./images/ubuntu && \
echo "Building Ubuntu 14.04" && \
docker build \
    --file ./images/ubuntu/Dockerfile_14_04 \
    --label "org.opencontainers.image.version=ubuntu-14.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:ubuntu-14.04 \
    --tag android-aosp-build:android-9 \
    --tag android-aosp-build:android-9-ubnt-14.04 \
    --tag android-aosp-build:android-10 \
    --tag android-aosp-build:android-10-ubnt-14.04 \
    --tag android-aosp-build:android-11 \
    --tag android-aosp-build:android-11-ubnt-14.04 \
    --tag android-aosp-build:android-12 \
    --tag android-aosp-build:android-12-ubnt-14.04 \
    --tag android-aosp-build:android-13 \
    --tag android-aosp-build:android-13-ubnt-14.04 \
    --tag android-aosp-build:latest \
    ./images/ubuntu && \
echo "Building Ubuntu 12.04" && \
docker build \
    --file ./images/ubuntu/Dockerfile_12_04 \
    --label "org.opencontainers.image.version=ubuntu-12.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:ubuntu-12.04 \
    ./images/ubuntu && \
echo "Building Ubuntu 10.04" && \
docker build \
    --file ./images/ubuntu/Dockerfile_10_04 \
    --label "org.opencontainers.image.version=ubuntu-10.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:ubuntu-10.04 \
    ./images/ubuntu && \
echo "Building Archlinux" && \
docker build \
    --label "org.opencontainers.image.version=archlinux-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:archlinux \
    --tag android-aosp-build:android-9-archlinux \
    --tag android-aosp-build:android-10-archlinux \
    --tag android-aosp-build:android-11-archlinux \
    --tag android-aosp-build:android-12-archlinux \
    --tag android-aosp-build:android-13-archlinux \
    ./images/archlinux && \
echo "Building Android 7.0 to 8.0 (Ubuntu 14.04)" && \
docker build \
    --file ./images/android/Dockerfile_7_8_ubnt_14_04 \
    --label "org.opencontainers.image.version=android-7-8-ubuntu-14.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-7 \
    --tag android-aosp-build:android-7-ubnt-14.04 \
    --tag android-aosp-build:android-8 \
    --tag android-aosp-build:android-8-ubnt-14.04 \
    ./images/android && \
echo "Building Android 7.0 to 8.0 (Ubuntu 18.04)" && \
docker build \
    --file ./images/android/Dockerfile_7_8_ubnt_18_04 \
    --label "org.opencontainers.image.version=android-7-8-ubuntu-18.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-7-ubnt-18.04 \
    --tag android-aosp-build:android-8-ubnt-18.04 \
    ./images/android && \
echo "Building Android 7.0 to 8.0 (Archlinux)" && \
docker build \
    --file ./images/android/Dockerfile_7_8_arch \
    --label "org.opencontainers.image.version=android-7-8-archlinux-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-7-arch \
    --tag android-aosp-build:android-8-arch \
    ./images/android && \
echo "Building Android 6.0 (Ubuntu 14.04)" && \
docker build \
    --file ./images/android/Dockerfile_6_ubnt_14_04 \
    --label "org.opencontainers.image.version=android-6-ubuntu-14.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-6 \
    ./images/android && \
echo "Building Android 5.0 (Ubuntu 12.04)" && \
docker build \
    --file ./images/android/Dockerfile_5_ubnt_12_04 \
    --label "org.opencontainers.image.version=android-5-ubuntu-18.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-5 \
    ./images/android && \
echo "Building Android 2.3.x to 4.4.x (Ubuntu 12.04)" && \
docker build \
    --file ./images/android/Dockerfile_2_4_ubnt_12_04 \
    --label "org.opencontainers.image.version=android-2.3-4.4-ubuntu-12.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-4 \
    --tag android-aosp-build:android-2.3 \
    ./images/android && \
echo "Building Android 1.5 to 2.2.x (Ubuntu 10.04)" && \
docker build \
    --file ./images/android/Dockerfile_1_2_ubnt_10_04 \
    --label "org.opencontainers.image.version=android-1.5-2.2-ubuntu-10.04-$BUILD_DATE" \
    --label "org.opencontainers.image.revision=$BUILD_COMMIT_HASH" \
    --label "org.opencontainers.image.created=$BUILD_DATE_RFC3339" \
    --tag android-aosp-build:android-2.2 \
    --tag android-aosp-build:android-2.1 \
    --tag android-aosp-build:android-2.0 \
    --tag android-aosp-build:android-1.6 \
    --tag android-aosp-build:android-1.5 \
    ./images/android && \
echo "Building finished"

