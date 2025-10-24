#!/bin/bash

set -e

./wakeCoop.sh
sleep 5
ssh root@thanatos.local.tartarus.cloud "cd /root/nix-config && git pull && make nixos.switch"

./wakeCoop.sh
sleep 5
ssh root@erinyes.local.tartarus.cloud "cd /root/nix-config && git pull && make nixos.switch"

./wakeCoop.sh
sleep 5
ssh root@atlas.local.tartarus.cloud "cd /root/nix-config && git pull && make nixos.switch"

./wakeCoop.sh
sleep 5
ssh root@theia.local.tartarus.cloud "cd /root/nix-config && git pull && make nixos.switch"
