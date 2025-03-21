_main:
    @just --list

# Build Jellyfin image
jellyfin:
    @cd jellyfin && just -f Justfile jellyfin-image

# Build Tailscale image
tailscale:
    @cd tailscale && just -f Justfile tailscale-image
