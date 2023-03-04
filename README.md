# Android AOSP Build with Docker

[![main](https://github.com/Akipe/android-aosp-build-docker/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/Akipe/android-aosp-build-docker/actions/workflows/main.yml)

*Work in progress. It may not work. I am waiting for your feedback : don't hesitate to add issues.*

Create a rapid development environment for building Android systems without taking the head. You can compile for almost all Android versions.

By default you will have the recommended environment depending on the Android version.

*I need feedback for old Android versions (from Android 8 to Android 1.5).*

These containers are for "manual" use. They replace for example the use of a virtual machine. They are not optimized for automatic construction.

Containers are updates automatically every week and every time I make a change.

## How to

### Choose your version

You must choose for which version of Android you will have to compile when you will define the image tag :

- `android-latest`
- `android-13`
- `android-12`
- `android-11`
- `android-10`
- `android-9`
- `android-8`
- `android-7`
- `android-6`
- `android-5`
- `android-4`
- `android-2.3`
- `android-2.2`
- `android-2.1`
- `android-2.0`
- `android-1.6`
- `android-1.5`

Some images use same image :

- from `android-latest` to `android-9`
- from `android-8` to `android-7`
- from `android-4` to `android-2.3`
- from `android-2.2` to `android-1.5`

`latest` tag reference `android-latest` to `android-9`.

You can choose also choose which distribution to use. You can find more information about how choosing the right version at [./doc/version.md](./doc/version.md)

### Run with `docker`

Here is an example of how to start the container (*change `/PATH/ANDROID_SOURCES` with your Android path*) :

```bash
docker run -d -v /PATH/ANDROID_SOURCES:/workspace -e UID=$UID --name builder-android-13 ak1pe/android-aosp-build:android-13
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
        environment:
            UID: ${UID:-1000}
            GID: ${UID:-1000}
            GIT_USERNAME: "Test Name"
            GIT_MAIL: "mail@test.com"
        volumes:
        - /PATH/HOST/ANDROID_WORKSPACE:/workspace

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

*More information at [doc/docker-compose.md](./doc/docker-compose.md).*

## Switch Python version

By default your will have Python 3 used.

You will need to switch to Python 2 in relation to certain moments of the constructions, for example before building most Android versions.

When you are connect to the shell, you can switch with this commands :

- Python 3
```bash
source /python/2/bin/activate
```

- Python 2
```bash
source /python/3/bin/activate
```

- Revert back
```bash
deactivate
```

> *If you have this kind of errors :*
> ```
> [  0% 21/13012] Generated: (.../out/target/product/DEVICE/> android-info.txt)
> FAILED: .../out/target/product/DEVICE/android-info.txt 
> /bin/bash -c "(build/make/tools/check_radio_versions.py ) && (echo \"board=sm6150\" > .../out/target/product/DEVICE/android-info.txt )"
>   File "build/make/tools/check_radio_versions.py", line 56
>     print "*** Error opening \"%s.sha1\"; can't verify %s" % (fn, key)
>           ^
> SyntaxError: invalid syntax
> [  0% 38/13012] target  C++: recovery-refresh <= bootable/recovery/rotate_logs.cpp
> ninja: build stopped: subcommand failed.
> 18:17:52 ninja failed with: exit status 1
> ```
> *Then you should try to change the version of Python used.*

## Documentation

- Which version to use ? [doc/version.md](./doc/version.md)
- How to change the version of Python ? [doc/python.md](./doc/python.md)
- How to enter inside the container ? [doc/shell.md](./doc/shell.md)
- How to use it with `docker compose` ? [doc/docker-compose.md](./doc/docker-compose.md)
- How to build myself ? [doc/build.md](./doc/build.md)
- How to change Java SDK version ? [doc/java.md](./doc/java.md)
- What resources I used : [doc/external_resources.md](./doc/external_resources.md)

## License

These project is under [MIT License](LICENSE), except for files [jdk-6u45-linux-x64.bin](images/android/assets/jdk-6u45-linux-x64.bin) & [jdk-1_5_0_22-linux-amd64.bin](images/android/assets/jdk-1_5_0_22-linux-amd64.bin) which are under the [Oracle Binary Code License Agreement for Java SE ](https://www.oracle.com/downloads/licenses/java-se-archive-license.html) license.

When using you use these images version :

- `android-4 `
- `android-2.3`
- `android-2.2`
- `android-2.1`
- `android-2.0`
- `android-1.6`
- `android-1.5`

Your automatically accept the [Oracle Binary Code License Agreement for Java SE ](https://www.oracle.com/downloads/licenses/java-se-archive-license.html) license.
