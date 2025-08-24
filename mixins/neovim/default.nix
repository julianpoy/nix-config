{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../node
  ];

  programs.neovim.enable = true;

  environment.systemPackages = with pkgs; [
    gcc
    python3
    python3Packages.pip
    python3Packages.pynvim
    ripgrep
    fd
  ];
}
