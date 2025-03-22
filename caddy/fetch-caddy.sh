#!/bin/bash

wget -q -O- https://github.com/wolfi-dev/os/raw/refs/heads/main/caddy.yaml | \
yq '.package.epoch += 1' | \
yq 'del(.test)' | \
yq 'del(.subpackages[].test)' | \
yq '.pipeline = [.pipeline[0,1,2,3]] + [{"runs": "go get github.com/go-chi/chi/v5\ngo get github.com/caddyserver/caddy/v2/modules/caddypki/acmeserver\ngo get github.com/caddy-dns/cloudflare\ngo get git.coopcloud.tech/decentral1se/caddy-incus-upstreams\ngo get github.com/caddy-dns/porkbun\ninstall -m755 -D \"./main.go.new\" \"cmd/caddy/main.go\"\n"}] + [.pipeline[4]]' \
> caddy.melange.yaml

wget -q -O Caddyfile https://github.com/wolfi-dev/os/raw/refs/heads/main/caddy/Caddyfile
wget -q -O index.html https://github.com/wolfi-dev/os/raw/refs/heads/main/caddy/index.html
wget -q -O quic-go.patch https://github.com/wolfi-dev/os/raw/refs/heads/main/caddy/quic-go.patch
