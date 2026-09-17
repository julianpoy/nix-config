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

8. Boot into your new install!
9. If you didn't commit your hardware-configuration.nix before, make sure to generate the hardware configuration again and commit it.
10. (optional) I like to keep a copy of the nix config in `~/nix-config` on the system. I recommend you do too - it's not there anymore since we only did that in the ephemeral install.

### Creating a new host

Creating a new host is pretty easy:

1. Copy an existing host folder in the `hosts` directory. I recommend copying `feanor`.
2. Change `networking.hostName` within `configuration.nix` for that host to match what you named the host folder.
3. Review `disk-config.nix`.

You do not need to change it so long as the following are true:

  * You have a single NVME SSD in your system
  * You wish to use the entirety of that NVME SSD, and are okay with it being wiped

If either of those two are not true, _you must change it_. I recommend using `lsblk -d -o NAME,SIZE,ID-LINK` to figure out the UUID of the disk you wish to use. Edit `/dev/nvme0n1` in the `disk-config.nix` to be `/dev/disk/by-id/YOUR-DISKS-ID-LINK`.

4. Change the software that will be installed by editing the section "Customize below this line!" within `default.nix`.

## A reference guide

### Updating Config

(possible precursor step is `git pull`, should you desire it)

1. Make a change in the repo on your system (did you put it in `~/nix-config`?)
2. Run `git add`
3. Run `make nixos.switch`
4. Commit and push your changes

### Updating to a New Major NixOS Version

You'll most likely only need to change two lines of your config, like this:

https://github.com/julianpoy/nix-config/pull/13/changes

Then follow the steps in [updating config](#updating-config). If you see any errors, then you'll need to do more work depending - most upgrades are pretty much no work though.

### Running New Software Without Installing

This could be temporary or not so temporary, but you can always run nix packages without installing them.

Find the package you want to run at https://search.nixos.org/packages

```
nix run nixpkgs#PACKAGENAME
```

If you want to provide args to the program in question:

```
nix run nixpkgs#PACKAGENAME -- arg1 arg2
```

If you're trying to run something unfree and you're seeing the unfree error:

```
NIXPKGS_ALLOW_UNFREE=1 nix run --impure nixpkgs#PACKAGENAME
```

### Adding New Software to Your System

If the software already exists somewhere in the `mixins` folder then:

1. Open your `hosts/YOUR_HOST/default.nix`.
2. Add it (alphabetically please) to the list of software in your mixins list.
3. Follow the steps in [updating config](#updating-config).

If the software does not exist somewhere in the `mixins` folder then:

1. Go to https://search.nixos.org/packages and find the name of the package you wish to install.
2. Decide if you need the version attached to your machine's version or whether you need the latest unstable.
3. Add a new mixin to the appropriate folder by copying an existing mixin. I recommend copying something simple like `mixins/applications/dbeaver.nix`.
4. If you want the unstable version of it, change `pkgs` to `pkgsUnstable`.
5. Open your `hosts/YOUR_HOST/default.nix`.
6. Add it (alphabetically please) to the list of software in your mixins list.
7. Follow the steps in [updating config](#updating-config).

### Updating Config on a Remote System

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

