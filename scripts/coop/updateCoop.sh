#!/bin/bash

set -e

./wakeCoop.sh
sleep 5
ssh root@thanatos.local.tartarus.cloud "nixos-rebuild switch --flake github:julianpoy/nix-config#coop-thanatos"

./wakeCoop.sh
sleep 5
ssh root@erinyes.local.tartarus.cloud "nixos-rebuild switch --flake github:julianpoy/nix-config#coop-erinyes"

./wakeCoop.sh
sleep 5
ssh root@atlas.local.tartarus.cloud "nixos-rebuild switch --flake github:julianpoy/nix-config#coop-atlas"

./wakeCoop.sh
sleep 5
ssh root@theia.local.tartarus.cloud "nixos-rebuild switch --flake github:julianpoy/nix-config#coop-theia"
