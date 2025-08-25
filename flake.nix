{
  description = "Julian's NixOS configuration";
  inputs = {
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=v0.6.0";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-2505.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager-2505.url = "github:nix-community/home-manager/release-25.05";
    home-manager-2505.inputs.nixpkgs.follows = "nixpkgs-2505";

    dotfiles.url = "github:julianpoy/dotfiles?rev=832d9b46e0ca71f7c58bf9f42da8da1b9d3080d8";
    dotfiles.flake = false;
  };

  outputs = inputs @ {
    self,
    disko,
    nixpkgs,
    ...
  }: let
    inherit
      (builtins)
      listToAttrs
      map
      readDir
      attrNames
      ;
  in {
    devShells = let
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
    in
      listToAttrs (map (system: {
          name = system;
          value =
            import ./devShell.nix
            {
              inherit system;
              specialArgs = inputs;
            };
        })
        systems);

    nixosConfigurations = listToAttrs (map (name: {
      inherit name;
      value = import ./hosts/${name}/default.nix {
        specialArgs = inputs;
      };
    }) (attrNames (readDir ./hosts)));
  };
}
