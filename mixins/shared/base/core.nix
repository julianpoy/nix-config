{
  config,
  pkgs,
  ...
}: {
  users.mutableUsers = false;

  # Disable legacy command-not-found since we're using flakes
  programs.command-not-found.enable = false;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # https://github.com/NixOS/nixpkgs/issues/159082
  nix.settings.trusted-users = [ "@wheel" ];

  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";

  # Select internationalisation propserties.
  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "America/Los_Angeles";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
}
