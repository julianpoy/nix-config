{
  description = "Julian's NixOS configuration";
  inputs = {
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs";

    nixpkgs-2505.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager-2505.url = "github:nix-community/home-manager/release-25.05";
    home-manager-2505.inputs.nixpkgs.follows = "nixpkgs-2505";
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
      systems = ["x86_64-linux" "aarch64-linux" "aaarch64-darwin"];
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
