{
  config,
  pkgs,
  ...
}: {
  # Matches the Framework 13 7xx0u series internal mic input and fixes the 100% volume issue
  wireplumber.extraConfig."51-mic-volume" = {
    "monitor.alsa.rules" = [
      {
        matches = [
          {
            "node.name" = "alsa_input.pci-0000_c1_00.6.analog-stereo";
          }
        ];
        actions = {
          update-props = {
            "audio.soft-volume" = 0.25;
          };
        };
      }
    ];
  };
}
