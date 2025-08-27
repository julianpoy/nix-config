#!/bin/bash

set -e

wakeonlan ec:75:0c:83:48:5c
sudo nixos-rebuild switch --flake ..#coop-thanatos --target-host coopadmin@10.0.1.187 --use-remote-sudo

wakeonlan ec:75:0c:83:47:d1
sudo nixos-rebuild switch --flake ..#coop-erinyes --target-host coopadmin@10.0.1.42 --use-remote-sudo

wakeonlan 98:b7:85:22:25:9a
sudo nixos-rebuild switch --flake ..#coop-atlas --target-host coopadmin@10.0.3.24 --use-remote-sudo

wakeonlan ec:75:0c:83:48:95
sudo nixos-rebuild switch --flake ..#coop-theia --target-host coopadmin@10.0.1.244 --use-remote-sudo
