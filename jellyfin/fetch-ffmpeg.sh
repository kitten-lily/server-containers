#!/bin/bash

wget -q -O- https://github.com/wolfi-dev/os/raw/refs/heads/main/ffmpeg.yaml | \
yq '.package.epoch += 1' | \
yq '.environment.contents.packages += ["libdrm-dev", "libva-dev"]' | \
yq 'del(.test)' | \
yq 'del(.subpackages[].test)' | \
sed 's/--enable-libzmq/--enable-libzmq \\\n        --enable-vaapi \\\n        --enable-libdrm\n/' \
> ffmpeg.melange.yaml
