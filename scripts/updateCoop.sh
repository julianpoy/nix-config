#!/bin/bash

set -e

wakeonlan ec:75:0c:83:48:5c
ssh root@10.0.1.187 "nixos-rebuild switch --flake github:julianpoy/nix-config#coop-thanatos"

wakeonlan ec:75:0c:83:47:d1
ssh root@10.0.1.42 "nixos-rebuild switch --flake github:julianpoy/nix-config#coop-erinyes"

wakeonlan 98:b7:85:22:25:9a
ssh root@10.0.3.24 "nixos-rebuild switch --flake github:julianpoy/nix-config#coop-atlas"

wakeonlan ec:75:0c:83:48:95
ssh root@10.0.1.244 "nixos-rebuild switch --flake github:julianpoy/nix-config#coop-theia"
