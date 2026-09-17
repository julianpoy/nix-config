# nix-config

Flakes-based and using disko.

## New Machine

1. [Create a new host](#creating-a-new-host) and push the new host to the hosted repo
2. Flash [NixOS](https://nixos.org/download/) to a flash drive and boot
3. Clone the repo on the target machine

```
git clone https://github.com/julianpoy/nix-config ~/nix-config
```

4. Generate your hardware config on the target machine

```
nixos-generate-config --no-filesystems --root /mnt --dir /tmp
```

5. Copy the generated hardware config to the repo

```
cp /tmp/hardware-configuration.nix ~/nix-config/hosts/NAME_OF_HOST/hardware-configuration.nix
```

You'll want to commit that generated hardware-configuration.nix to the repo, but doing that now is kinda annoying because you don't have SSH/auth setup.
You can always re-generate the hardware-configuration.nix later (it'll be the same) once you've booted into the system for the first time and then commit it.

6. Run disko to format the storage

```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /path/to/disk-config.nix
```

7. Install NixOS

(note the # that must be present)

```
sudo nixos-install --flake .#NAME_OF_HOST
```

8. If you didn't commit your hardware-configuration.nix before, make sure to generate the hardware configuration again and commit it.

### Creating a new host

Creating a new host is pretty easy:

1. Copy an existing host folder in the `hosts` directory. I recommend copying `feanor`.
2. Change `networking.hostName` within `configuration.nix` for that host to match what you named the host folder.
3. Review `disk-config.nix`. You do not need to change it so long as the following are true:
  1. You have a single NVME SSD in your system
  2. You wish to use the entirety of that NVME SSD, and are okay with it being wiped
If either of those two are not true, _you must change it_. I recommend using `lsblk -d -o NAME,SIZE,ID-LINK` to figure out the UUID of the disk you wish to use. Edit `/dev/nvme0n1` in the `disk-config.nix` to be `/dev/disk/by-id/YOUR-DISKS-ID-LINK`.
4. Change the software that will be installed by editing the section "Customize below this line!" within `default.nix`.

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

### REPL

```
nix repl --extra-experimental-features flakes
```

then

```
:lf github:julianpoy/nix-config
```

then hit tab to see the variables in scope.

