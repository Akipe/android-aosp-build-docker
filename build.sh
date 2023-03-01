#!/bin/sh

docker build -t android-aosp-build:archlinux ./archlinux/
docker build -t android-aosp-build:ubuntu-18.04 -f ./ubuntu/Dockerfile_18_04 ./ubuntu/
docker build -t android-aosp-build:ubuntu-14.04 -f ./ubuntu/Dockerfile_14_04 ./ubuntu/
docker build -t android-aosp-build:ubuntu-12.04 -f ./ubuntu/Dockerfile_12_04 ./ubuntu/
docker build -t android-aosp-build:ubuntu-10.04 -f ./ubuntu/Dockerfile_10_04 ./ubuntu/
