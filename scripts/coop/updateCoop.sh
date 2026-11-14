#!/bin/bash

ssh root@coop-thanatos.local "cd /root/nix-config && git pull && make nixos.switch"

ssh root@coop-erinyes.local "cd /root/nix-config && git pull && make nixos.switch"

ssh root@coop-atlas.local "cd /root/nix-config && git pull && make nixos.switch"

ssh root@coop-theia.local "cd /root/nix-config && git pull && make nixos.switch"
