#!/bin/bash

ssh root@thanatos.local.tartarus.cloud "cd /root/nix-config && git pull && make nixos.switch"

ssh root@erinyes.local.tartarus.cloud "cd /root/nix-config && git pull && make nixos.switch"

ssh root@atlas.local.tartarus.cloud "cd /root/nix-config && git pull && make nixos.switch"

ssh root@theia.local.tartarus.cloud "cd /root/nix-config && git pull && make nixos.switch"
