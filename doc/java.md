# Set the correct Java JDK

With old Android version (to Android 8.0), you need to defined which JDK to use for building.

## JDK available from versions

### Ubuntu 18.04

JDK available :
- openjdk-8-jdk

### Ubuntu 14.04

JDK available :
- openjdk-8-jdk
- openjdk-7-jre

### Ubuntu 12.04

JDK available :
- openjdk-8-jdk
- openjdk-7-jdk

### Ubuntu 10.04

JDK available :
- openjdk-7-jdk
- openjdk-6-jdk

## How to change

Connect to the shell of your container ([how to](shell.md)), then execute this command :
```bash
sudo update-alternatives --config java
sudo update-alternatives --config javac
```
