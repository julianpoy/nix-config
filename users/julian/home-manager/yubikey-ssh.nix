{
  lib,
  config,
  specialArgs,
  pkgs,
  ...
}: {
  programs.gpg = {
    enable = true;
    publicKeys = [
      {source = ../72DC5D65A37D62C2.asc; trust = 5;}
    ];
  };
}
