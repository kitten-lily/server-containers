_main:
    @just --list

# Build Jellyfin image
jellyfin:
    @cd jellyfin && just -f Justfile jellyfin-image
