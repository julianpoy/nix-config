{
  pkgs,
  lib,
  desiredColor,
  ...
}: let
  setcolor = pkgs.writeScriptBin "setcolor" ''
    #!/bin/sh
    NUM_DEVICES=$(${pkgs.openrgb}/bin/openrgb --noautoconnect --list-devices | grep -E '^[0-9]+: ' | wc -l)
    ZONES=$(openrgb --noautoconnect --list-devices | grep -E 'Zones: '.+'+')

    ARGS=""
    for i in $(seq 0 $(($NUM_DEVICES - 1))); do
      NUM_ZONES=$(openrgb --noautoconnect --list-devices | grep -E 'Zones: \'.*\'+' | sed -n '${i}p' | grep -oP "'.*?'" | wc -l)
      for j in $(seq 0 $(($NUM_ZONES - 1))); do
        ARGS=$ARGS --device $i --mode direct --color ${desiredColor} --zone $j --size 20
      done
    done

    ${pkgs.openrgb}/bin/openrgb --noautoconnect --device $i --mode direct --color ${desiredColor} --zone 0 --size 20 --device $i --mode direct --color ${desiredColor} --zone 1 --size 20
  '';
in {
  config.systemd.services.set-static-rgb-color = {
    description = "set-static-rgb-color";
    serviceConfig = {
      ExecStart = "${setcolor}/bin/setcolor";
      Type = "oneshot";
    };
    wantedBy = ["multi-user.target"];
  };
}
