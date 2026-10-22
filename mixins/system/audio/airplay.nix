{
  config,
  pkgs,
  ...
}: {
  services.pipewire.raopOpenFirewall = true;
  services.pipewire.extraConfig.pipewire."10-airplay" = {
    "context.modules" = [
      {
        name = "libpipewire-module-raop-discover";
        args = {
          "stream.rules" = [
            {
              matches = [{"raop.ip" = "~.*";}];
              actions = {
                create-stream = {
                  "stream.props" = {
                    "node.group" = "pipewire.dummy";
                  };
                };
              };
            }
          ];
        };
      }
    ];
  };

  services.pipewire.wireplumber.extraScripts."linking/airplay-block-monitors.lua" = ''
    lutils = require ("linking-utils")
    cutils = require ("common-utils")

    SimpleEventHook {
      name = "linking/airplay-block-monitors",
      after = { "linking/find-defined-target", "linking/find-default-target",
                "linking/find-best-target", "linking/get-filter-from-target" },
      before = "linking/prepare-link",
      interests = {
        EventInterest {
          Constraint { "event.type", "=", "select-target" },
        },
      },
      execute = function (event)
        local _, _, _, si_props, _, target = lutils:unwrap_select_target_event (event)
        if target and cutils.parseBool (si_props ["stream.monitor"]) and
            target.properties ["sess.media"] == "raop" then
          event:stop_processing ()
        end
      end
    }:register ()
  '';

  services.pipewire.wireplumber.extraConfig."90-airplay-block-monitors" = {
    "wireplumber.components" = [
      {
        name = "linking/airplay-block-monitors.lua";
        type = "script/lua";
        provides = "custom.airplay-block-monitors";
      }
    ];
    "wireplumber.profiles" = {
      main = {
        "custom.airplay-block-monitors" = "required";
      };
    };
  };
}
