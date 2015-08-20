## arch-openjdk8 and headless jre8 [![](https://badge.imagelayers.io/marcelhuberfoo/arch-openjdk8.svg)](https://imagelayers.io/?images=marcelhuberfoo/arch-openjdk8 'Get your own badge on imagelayers.io')

## Purpose

This docker image builds on top of [marcelhuberfoo/arch][dockerarch] image for the purpose of running
headless java applications like `jenkins` or `gerrit`. It provides several features of which some are already present in the base image:

* A non-root user and group `docky` for executing programs inside the container.
* A umask of 0002 for user `docky`.
* Exported variables `UNAME`, `GNAME`, `UID` and `GID` to make use of the user settings from within scripts.
* Timezone (`/etc/localtime`) is linked to `Europe/Zurich`, adjust if required in a derived image.

## Usage

### arch-openjdk8

This image does not override the default entrypoint from the base image. It's only purpose is to serve as a base for java applications.

```bash
docker run --rm marcelhuberfoo/arch-openjdk8 java -version
```

[dockerarch]: https://registry.hub.docker.com/u/marcelhuberfoo/arch/
