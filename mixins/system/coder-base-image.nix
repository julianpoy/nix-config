{
  config,
  pkgs,
  ...
}: let
  baseImage = pkgs.writeShellApplication {
    name = "coder-base-image";
    runtimeInputs = [pkgs.nix pkgs.git pkgs.coreutils pkgs.libvirt];
    text = ''
      flake="github:julianpoy/nix-config"
      pool="/home/tartarus/coder-libvirt-pool"

      release=$(nix eval --raw "$flake#nixosConfigurations.coder.config.system.nixos.release")
      name="nixos-prebaked-base-$release-$(date +%Y-%m-%d).qcow2"

      if [ -e "$pool/$name" ]; then
        echo "$pool/$name already exists" >&2
        exit 1
      fi

      image=$(nix build --no-link --print-out-paths \
        "$flake#nixosConfigurations.coder.config.system.build.qcow2")

      staging=$(mktemp -p "$(dirname "$pool")" .coder-base-image.XXXXXX)
      trap 'rm -f "$staging"' EXIT

      install -m 0444 "$image/nixos.qcow2" "$staging"
      sync "$staging"
      mv "$staging" "$pool/$name"
      virsh -c qemu:///system pool-refresh fasttank

      echo "$name"
    '';
  };
in {
  environment.systemPackages = [baseImage];
}
