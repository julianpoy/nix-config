{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    yubikey-personalization
    yubikey-manager
    yubioath-flutter
    yubikey-agent
    pinentry-qt
    gnupg
    opensc
    libfido2
    pcsclite
  ];
  services.udev.packages = [
    #pkgs.yubikey-manager-udev
    pkgs.yubikey-personalization
  ];

  hardware.gpgSmartcards.enable = true;
  services.yubikey-agent.enable = true;
  services.pcscd.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableExtraSocket = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-qt;
  };
}
