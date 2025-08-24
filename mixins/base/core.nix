{
  config,
  pkgs,
  ...
}: {
  # Replace legacy command-not-found with nix-index
  programs.command-not-found.enable = false;
  programs.nix-index.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.networkmanager.enable = true;

  nixpkgs.config.allowUnfree = true;

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
