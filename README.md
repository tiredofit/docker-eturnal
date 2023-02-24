# github.com/tiredofit/eturnal

[![GitHub release](https://img.shields.io/github/v/tag/tiredofit/docker-eturnal?style=flat-square)](https://github.com/tiredofit/docker-eturnal/releases)
[![Build Status](https://img.shields.io/github/workflow/status/tiredofit/docker-eturnal/build?style=flat-square)](https://github.com/tiredofit/docker-eturnal/actions?query=workflow%3Abuild)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/eturnal.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/eturnal/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/eturnal.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/eturnal/)
[![Become a sponsor](https://img.shields.io/badge/sponsor-tiredofit-181717.svg?logo=github&style=flat-square)](https://github.com/sponsors/tiredofit)
[![Paypal Donate](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square)](https://www.paypal.me/tiredofit)

## About

This will build a Docker Image for [Eturnal](https://eturnal.net/), A STUN and TURN server

## Maintainer

- [Dave Conroy](https://github.com/tiredofit/)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Build from Source](#build-from-source)
  - [Prebuilt Images](#prebuilt-images)
    - [Multi Architecture](#multi-architecture)
- [Configuration](#configuration)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
    - [Container Options](#container-options)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [Support](#support)
  - [Usage](#usage)
  - [Bugfixes](#bugfixes)
  - [Feature Requests](#feature-requests)
  - [Updates](#updates)
- [License](#license)
- [References](#references)


## Installation
### Build from Source
Clone this repository and build the image with `docker build -t (imagename) .`

### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/eturnal).

```
docker pull tiredofit/eturnal:(imagetag)
```

Builds of the image are also available on the [Github Container Registry](https://github.com/tiredofit/eturnal/pkgs/container/eturnal)

```
docker pull ghcr.io/tiredofit/docker-eturnal:(imagetag)
```

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Container OS | Tag       |
| ------------ | --------- |
| Alpine       | `:latest` |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`

## Configuration

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [compose.yml](examples/compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description         |
| --------- | ------------------- |
| /config/  | Configuration Files |
| /logs/    | Configuration Files |

* * *
### Environment Variables

#### Base Images used

This image relies on an [Alpine Linux](https://hub.docker.com/r/tiredofit/alpine) base image that relies on an [init system](https://github.com/just-containers/s6-overlay) for added capabilities. Outgoing SMTP capabilities are handlded via `msmtp`. Individual container performance monitoring is performed by [zabbix-agent](https://zabbix.org). Additional tools include: `bash`,`curl`,`less`,`logrotate`,`nano`,`vim`.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                  | Description                            |
| ------------------------------------------------------ | -------------------------------------- |
| [OS Base](https://github.com/tiredofit/docker-alpine/) | Customized Image based on Alpine Linux |


#### Container Options

| Variable                             | Value                                                                               | Default                        |
| ------------------------------------ | ----------------------------------------------------------------------------------- | ------------------------------ |
| `BLACKLIST_IP`                       | Comma seperated                                                                     | `127.0.0.0/8,::1`              |
| `CONFIG_FILE`                        |                                                                                     | `eturnal.yml`                  |
| `CONFIG_PATH`                        |                                                                                     | `/config/`                     |
| `DATA_PATH`                          |                                                                                     | `/data/`                       |
| `ENABLE_IPV4`                        | Enable IPV4 Support                                                                 | `TRUE`                         |
| `ENABLE_IPV6`                        | Enable IPV Support                                                                  | `FALSE`                        |
| `ENABLE_LOG_STUN`                    |                                                                                     | `FALSE`                        |
| `ENABLE_STATS_INFLUX`                |                                                                                     | `FALSE`                        |
| `ENABLE_STATS_PROMETHEUS`            |                                                                                     | `FALSE`                        |
| `ENABLE_TCP`                         |                                                                                     | `TRUE`                         |
| `ENABLE_TLS`                         |                                                                                     | `FALSE`                        |
| `ENABLE_UDP`                         |                                                                                     | `TRUE`                         |
| `ETURNALCTL_ARGS`                    |                                                                                     |                                |
| `LOG_FILE`                           |                                                                                     | `eturnal.log`                  |
| `LOG_LEVEL`                          | `critical` `debug` `error` `info` `notice` `warning`                                | `info`                         |
| `LOG_PATH`                           |                                                                                     | `/logs/`                       |
| `LOG_TYPE`                           |                                                                                     | `FILE`                         |
| `PUBLIC_IPV4`                        | `auto` to use `STUN_IPV4_HOST` or IPV4 eg `123.123.123.123`                         |                                |
| `PUBLIC_IPV6`                        | `auto` to use `STUN_IPV6_HOST` or IPV6 eg `FE80:0000:0000:0000:0202:B3FF:FE1E:8329` |                                |
| `RELAY_MAX_PORT`                     |                                                                                     | `65535`                        |
| `RELAY_MIN_PORT`                     |                                                                                     | `49152`                        |
| `SECRET`                             |                                                                                     | `tiredofit`                    |
| `SETUP_MODE`                         |                                                                                     | `AUTO`                         |
| `STATS_INFLUX_HOST`                  |                                                                                     | ``                             |
| `STATS_INFLUX_PORT`                  |                                                                                     | `8089`                         |
| `STATS_PROMETHEUS_ENABLE_TLS`        |                                                                                     | `FALSE`                        |
| `STATS_PROMETHEUS_ENABLE_VM_METRICS` |                                                                                     | `false`                        |
| `STATS_PROMETHEUS_LISTEN_IP`         |                                                                                     | `127.0.0.1`                    |
| `STATS_PROMETHEUS_LISTEN_PORT`       |                                                                                     | `8081`                         |
| `STRICT_EXPIRY`                      |                                                                                     | `false`                        |
| `STUN_IPV4_HOST`                     | Use this host to lookup your IPV4 Address                                           | `stun.google.com:19302`        |
| `STUN_IPV6_HOST`                     | Use this host to lookup your IPV6 Address                                           | `[2a01:4f8:1c0c:6374::1]:3478` |
| `STUN_LOG_LEVEL`                     | `critical` `debug` `error` `info` `notice` `warning`                                | `${LOG_LEVEL}`                 |
| `TCP_LISTEN_IP`                      |                                                                                     | `::`                           |
| `TCP_LISTEN_PORT`                    |                                                                                     | `3478`                         |
| `TLS_CERT_FILE`                      |                                                                                     | `cert.pem`                     |
| `TLS_KEY_FILE`                       |                                                                                     | `key.pem`                      |
| `TLS_LISTEN_IP`                      |                                                                                     | `::`                           |
| `TLS_LISTEN_PORT`                    |                                                                                     | `5349`                         |
| `UDP_LISTEN_IP`                      |                                                                                     | `::`                           |
| `UDP_LISTEN_PORT`                    |                                                                                     | `3478`                         |
| `WHITELIST_IP`                       |                                                                                     | ``                             |

### Networking

| Port   | Protocol | Description |
| ------ | -------- | ----------- |
| `3478` | `udp`    |             |
| `3478` | `tcp`    |             |
| `5349` | `tls`    |             |


## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is) bash
```
## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for personalized support.
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.

## References

* <https://eturnal.net/>
