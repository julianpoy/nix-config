{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    gnupg
    yubikey-personalization
    pinentry-qt
  ];
  services.udev.packages = [ pkgs.yubikey-personalization ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.yubikey-agent.enable = true;
  services.pcscd.enable = true;
}
