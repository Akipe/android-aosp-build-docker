# Android AOSP Build with Docker

*Work in progress. I am waiting for feed : don't hesitate to add issues.*

Containers images for helping you to manually build Android system without editing your system. All the necessary is included

*I need feedback for building old Android systems with old Ubuntu images (14.04, 12.04 and 10.04).*

## How to

### Example with `docker`

Start the container (*change `/PATH/ANDROID_SOURCES` with your Android path*) :
```bash
docker run -d -v /PATH/ANDROID_SOURCES:/workspace --name builder-android-13 ak1pe/android-aosp-build:android-13
```

Get shell :
```bash
docker exec -it builder-android-13 bash
```

Now you can execute your commands for building.

*Work with podman too.*

### Example with `docker compose`

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

Start the container :
```bash
docker compose up -d docker-compose.yml
```

Get shell :
```bash
docker compose exec builder-android-13 bash
```

Now you can execute your commands for building.

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
