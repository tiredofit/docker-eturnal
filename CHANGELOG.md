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


