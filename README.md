# powerdns-docker

## 概要

PowerDNSとPowerDNS-AdminをDockerで動かすリポジトリ。
RaspberryPi対応。

## 参考

https://github.com/PowerDNS/pdns  
https://github.com/PowerDNS-Admin/PowerDNS-Admin

## インストール方法

1. compose.ymlにAPIキーなどを設定
2. conf内のconfigを適宜設定。
3. `docker compose up -d`で起動。
