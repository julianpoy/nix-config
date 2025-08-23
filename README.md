# nix-config

disko manual

## Useful Notes

### Hardware Config

To generate a hardware config for a machine that will end up using disko (gets deposited as /tmp/hardware-config.nix).

```
nixos-generate-config --no-filesystems --root /mnt --dir /tmp
```

Copy that into the associated host.

### Running Disko Manually

```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /path/to/disk-config.nix
```

### Running Nixos-Anywhere

1. Boot into nix (non-graphical is fine)
2. Set a password
3. Generate a hardware config for the machine and copy that into the associated host
4. Run the command below (from another machine on the network)

```
nix run github:nix-community/nixos-anywhere --extra-experimental-features nix-command --extra-experimental-features flakes -- --flake '.#coop-atlas' --target-host nixos@IP_ADDRESS
```

