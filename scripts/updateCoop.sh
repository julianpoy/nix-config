#!/bin/bash

set -e

wakeonlan ec:75:0c:83:48:5c
nixos-rebuild switch --flake ..#coop-thanatos --target-host root@10.0.1.187

wakeonlan ec:75:0c:83:47:d1
nixos-rebuild switch --flake ..#coop-erinyes --target-host root@10.0.1.42

wakeonlan 98:b7:85:22:25:9a
nixos-rebuild switch --flake ..#coop-atlas --target-host root@10.0.3.24

wakeonlan ec:75:0c:83:48:95
nixos-rebuild switch --flake ..#coop-theia --target-host root@10.0.1.244
