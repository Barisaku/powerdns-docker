# powerdns-docker

## 概要

PowerDNSとPowerDNS-AdminをDockerで動かすリポジトリ。
RaspberryPi対応。

## 参考

https://github.com/PowerDNS/pdns  
https://github.com/PowerDNS-Admin/PowerDNS-Admin

## インストール方法

1. api-key.envにAPIキーを設定
2. conf内のconfigをコメントを参考に適宜設定。
3. `docker compose up -d`で起動。

## ビルド方法

1. 同じディレクトリにPowerDNSとPowerDNS-Adminのリポジトリをクローン
2. `compose.yaml`ファイルのBuildのコメントを外して、imageをコメントアウト
3. `docker compose build`でビルドする。

※ RaspberryPi上でビルドするとスペック不足に陥ることがあるので、Buildxなどで事前にArm版のImageをビルドしておくことをオススメします。　　

※ 私の場合PowerDNS-Adminのビルドで失敗し、Dockerfileの`BUILD_DEPENDENCIES`に`py3-pip`を追加してあげることで解決できた。
