# Versions and tags

List of all tags available :

- `latest`
- `android-latest`
- `android-latest-ubuntu-14.04`
- `android-latest-ubuntu-18.04`
- `android-latest-archlinux`
- `android-13`
- `android-13-ubuntu-14.04`
- `android-13-ubuntu-18.04`
- `android-13-archlinux`
- `android-12`
- `android-12-ubuntu-14.04`
- `android-12-ubuntu-18.04`
- `android-12-archlinux`
- `android-11`
- `android-11-ubuntu-14.04`
- `android-11-ubuntu-18.04`
- `android-11-archlinux`
- `android-10`
- `android-10-ubuntu-14.04`
- `android-10-ubuntu-18.04`
- `android-10-archlinux`
- `android-9`
- `android-9-ubuntu-14.04`
- `android-9-ubuntu-18.04`
- `android-9-archlinux`
- `android-8`
- `android-8-ubuntu-14.04`
- `android-8-ubuntu-18.04`
- `android-8-archlinux`
- `android-7`
- `android-7-ubuntu-14.04`
- `android-7-ubuntu-18.04`
- `android-7-archlinux`
- `android-6`
- `android-6-ubuntu-14.04`
- `android-5`
- `android-5-ubuntu-12.04`
- `android-4`
- `android-4-ubuntu-12.04`
- `android-2.3`
- `android-2.3-ubuntu-12.04`
- `android-2.2`
- `android-2.2-ubuntu-10.04`
- `android-2.1`
- `android-2.1-ubuntu-10.04`
- `android-2.0`
- `android-2.0-ubuntu-10.04`
- `android-1.6`
- `android-1.6-ubuntu-10.04`
- `android-1.5`
- `android-1.5-ubuntu-10.04`

When you set tag without distribution, it will configure the distribution recommended on [Android documentation](https://source.android.com/docs/setup/start/initializing).

## Feature available

| Tag | Android version | Distribution | Java installed | Python available | 
|---|---|---|---|---
| `android-latest` to `android-9` (same with `-ubuntu-14.04`) | Android 9 to latest version| Ubuntu 14.04 | none | Python `3.6` and `2.7`
| `android-latest-ubuntu-18.04` to `android-android-9-ubuntu-18.04` | Android 9 to latest version | Ubuntu 18.04 | none | Python `3.6` and `2.7`
| `android-latest-archlinux` to `android-9-archlinux` | Android 9 to latest version | Archlinux | none | latest Python `3` and `2.7`
| `android-8` to `android-7` (same with `-ubuntu-14.04`) | Android 7 to Android 8 | Ubuntu 14.04 | OpenJDK 8 | Python `3.6` and `2.7`
| `android-8-ubuntu-18.04` to `android-7-ubuntu-18.04` | Android 7 to Android 8 | Ubuntu 18.04 | OpenJDK 8 | Python `3.6` and `2.7`
| `android-8-archlinux` to `android-7-archlinux` | Android 7 to Android 8 | Archlinux | OpenJDK 8 | latest Python `3` and `2.7`
| `android-6` (same with `-ubuntu-14.04`) | Android 6 | Ubuntu 14.04 | OpenJDK 7 | Python `3.6` and `2.7`
| `android-5` (same with `-ubuntu-12.04`) | Android 5 | Ubuntu 12.04 | OpenJDK 7 | Python `3.6` and `2.7`
| `android-4` to `android-2.3` (same with `-ubuntu-12.04`) | Android 4 to Android 2.3 | Ubuntu 12.04 | Java JDK 6 | Python `3.6` and `2.7`
| `android-2.2` to `android-1.5` (same with `-ubuntu-10.04`) | Android 2.2 to Android 1.5 | Ubuntu 10.04 | Java JDK 5 | Python `2.7`

When Java is not installed, the build process will used the prebuilt contains inside the AOSP source.

For changing which Python to use, check the [python.md](python.md) documentation.
