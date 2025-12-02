{
  config,
  pkgs,
  ...
}: {
  # This blocks all applications from automatically adjusting your mic volume
  services.pipewire.extraConfig.pipewire-pulse."99-block-mic-volume" = {
    "pulse.rules" = [
      {
        matches = [
          {
            # Match all sources (microphones)
            "media.class" = "Audio/Source";
          }
        ];
        actions = {
          quirks = [ "block-source-volume" ];
        };
      }
    ];
  };
}
