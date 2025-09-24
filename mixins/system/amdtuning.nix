{
  config,
  pkgs,
  ...
}: {
  # Force use of RADV
  environment.variables.AMD_VULKAN_ICD = "RADV";

  # GUI stuff for tuning AMD
  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = ["multi-user.target"];
}
