# Android AOSP Build with Docker

*Work in progress. I am waiting for your feedback : don't hesitate to add issues.*

Containers to help you compile Android without worrying about how to set up your development environment. You can compile for almost all Android versions.

*I need feedback for building old Android systems with old Ubuntu images (14.04, 12.04 and 10.04).*

Containers are updates automatically every week and every time I make a change.

## How to

### Choose your version

You must choose for which version of Android you will have to compile when you will define the image tag :

- ak1pe/android-aosp-build:android-13
- ak1pe/android-aosp-build:android-12
- ak1pe/android-aosp-build:android-11
- ak1pe/android-aosp-build:android-10
- ak1pe/android-aosp-build:android-9
- ak1pe/android-aosp-build:android-8
- ak1pe/android-aosp-build:android-7
- ak1pe/android-aosp-build:android-6
- ak1pe/android-aosp-build:android-5
- ak1pe/android-aosp-build:android-4
- ak1pe/android-aosp-build:android-2.3
- ak1pe/android-aosp-build:android-2.2
- ak1pe/android-aosp-build:android-2.1
- ak1pe/android-aosp-build:android-2.0
- ak1pe/android-aosp-build:android-1.6
- ak1pe/android-aosp-build:android-1.5

You can find more information about how choosing the right version : [./doc/version.md](./doc/version.md)

### Run with `docker`

Here is an example of how to start the container (*change `/PATH/ANDROID_SOURCES` with your Android path*) :

```bash
docker run -d -v /PATH/ANDROID_SOURCES:/workspace --name builder-android-13 ak1pe/android-aosp-build:android-13
```

Then you can control the shell :

```bash
docker exec -it builder-android-13 bash
```

Now you can execute any commands for building.

*Work with podman too.*

### Run with `docker compose`

Here is an other example of how to define your `docker-compose.yml` :

```yml
# docker-compose.yml
---
version: "3.5"

services:
    builder-android-13:
        image: "ak1pe/android-aosp-build:android-13"
        volumes:
        - /PATH/WHERE/ANDROID_SOURCES:/workspace

```

Then you can start the container :

```bash
docker compose up -d docker-compose.yml
```

At last you can control the shell :

```bash
docker compose exec builder-android-13 bash
```

Now you can execute any commands for building.

## Documentation

- Which version to use ? [doc/version.md](./doc/version.md)
- How to enter inside the container ? [doc/shell.md](./doc/shell.md)
- How to use it with `docker compose` ? [doc/docker-compose.md](./doc/docker-compose.md)
- How to build myself ? [doc/build.md](./doc/build.md)
- How to change Java SDK version ? [doc/java.md](./doc/java.md)

## External resources

Resources used for creating this images :
- <https://source.android.com/docs/setup/start/initializing>
- <https://source.android.com/docs/setup/start/older-versions>
- <https://android.googlesource.com/platform/build/+/master/tools/docker/Dockerfile>
- <https://nathanpfry.com/how-to-setup-ubuntu-18-04-lts-bionic-beaver-to-compile-android-roms/>
- <https://developer.sony.com/develop/open-devices/guides/aosp-build-instructions/build-aosp-android-13>
- <https://wiki.lineageos.org/devices/bacon/build>
- <https://source.android.com/docs/setup/create/jack>

## License

[MIT License](LICENSE)
