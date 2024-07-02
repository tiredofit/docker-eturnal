## 1.1.0 2024-07-02 <dave at tiredofit dot ca>

   ### Added
      - Add ETURNAL_USER and ETURNAL_GROUP environment variables
      - Set permissions on /usr/lib/eturnal/run on startup to accomodate for changed uid/gid
      - Alpine 3.20 base


## 1.0.5 2023-12-08 <dave at tiredofit dot ca>

   ### Added
      - Change base image to tiredofit/alpine:3.19


## 1.0.4 2023-09-28 <dave at tiredofit dot ca>

   ### Added
      - Eturnal 1.12.0


## 1.0.3 2023-08-06 <dave at tiredofit dot ca>

   ### Added
      - ETurnal 1.1.1


## 1.0.2 2023-08-06 <dave at tiredofit dot ca>

   ### Added
      - Eturnal 1.11.0


## 1.0.1 2023-05-10 <dave at tiredofit dot ca>

   ### Added
      - Alpine 3.18 base


## 1.0.0 2023-02-24 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix exporting of metrics and include template
      - Add TLS Support for prometheus metrics
      - Add TLS_CIPHER,TLS_OPTIONS,TLS_DHPARAM_FILE support
      - Add PROXY protocol support for TLS and TCP
      - Add MAX_BPS and MAX_PERMISSIONS settings


## 0.8.1 2023-02-24 <dave at tiredofit dot ca>

   ### Changed
      - Bugfixes to TLS IP address, certificates, and strict expiry statements


## 0.8.0 2023-02-23 <dave at tiredofit dot ca>

   ### Added
      - Add alias for eturnalctl to run as eturnal user when in shell
      - Add REALM configuration
      - Add SOFTWARE_NAME configuration
      - Set better permissions on CONFIG_FILE
      - Drop DATA_PATH
      - Enable switching off and on TURN per transport layer
      - Change STUN_*_HOST to STUN_*_SERVICE
      - Work with erlang cookies better


## 0.5.0 2023-02-23 <dave at tiredofit dot ca>

   ### Added
      - Eturnal 1.10.1
      - Auto configurable config path, config file
      - Auto lookup IP addresses against STUN server


