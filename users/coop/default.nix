{stateVersion}: {
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./home-manager
  ];

  users.users.coop = {
    isNormalUser = true;
    description = "bawk";
    extraGroups = [
      "networkmanager"
    ];
    hashedPassword = "$y$j9T$hhNxV.Yd6CX1OJ90n1y4R1$vAFoWvMDoBQhxGgInw0UaJMgexNEqi6g7FZpjaphq/A";
  };

  home-manager.users.coop.home.stateVersion = stateVersion;
}
