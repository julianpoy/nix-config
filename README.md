# nix-config

Flakes-based and using disko with nixos-anywhere.

## New Machine

1. Boot non-graphical nix
2. Set password for nixos user (`passwd`)
3. Generate and grab [hardware config](#hardware-config)
4. Create new host in repo with hardware config from machine (`cat /etc/hardware-configuration.nix`) and disk configuration as desired
5. Commit & push new host configuration
6. [Run nixos-anywhere](#running-nixos-anywhere)

### Hardware Config

To generate a hardware config for a machine that will end up using disko (gets deposited as /tmp/hardware-configuration.nix).

```
nixos-generate-config --no-filesystems --root /mnt --dir /tmp
```

Copy that into the associated host directory within this repo.

### Running Nixos-Anywhere

Note: This is destructive and will wipe all data with disko.

Run the command below (from another machine on the network, or using `localhost`) with the HOST you'd like (HOST must match one of the items in the `hosts/` directory here.

```
nix run github:nix-community/nixos-anywhere --extra-experimental-features nix-command --extra-experimental-features flakes -- --flake github:julianpoy/nix-config#HOST --target-host nixos@IP_ADDRESS
```

## Other Stuff

### Updating Config Later

After setting a machine up with flake support run either:

```
nixos-rebuild switch --flake github:julianpoy/nix-config
```

or

```
nixos-rebuild switch --flake github:julianpoy/nix-config --target-host "root@IP_ADDRESS"
```

### Running Disko Manually

```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /path/to/disk-config.nix
```

### REPL

```
nix repl --extra-experimental-features flakes
```

then

```
:lf github:julianpoy/nix-config
```

then hit tab to see the variables in scope.

