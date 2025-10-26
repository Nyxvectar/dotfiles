{ lib, config, ... }:
with lib;
with types;
let
  monitor = submodule {
    options = {
      isMain = mkOption {
        type = bool;
        description = "Whether the monitor is the main one";
        default = false;
      };
      scale = mkOption {
        type = float;
        description = "The scale of the monitor";
        default = 1.0;
      };
      mode = mkOption {
        type = submodule {
          options = {
            width = mkOption {
              type = int;
              description = "The width of the monitor";
            };
            height = mkOption {
              type = int;
              description = "The height of the monitor";
            };
            refresh = mkOption {
              type = float;
              description = "The refresh rate of the monitor";
            };
          };
        };
      };
      position = mkOption {
        type = submodule {
          options = {
            x = mkOption {
              type = int;
              description = "The x position of the monitor";
            };
            y = mkOption {
              type = int;
              description = "The y position of the monitor";
            };
          };
        };
      };
      rotation = mkOption {
        type = int;
        description = "The rotation of the monitor";
      };
      focus-at-startup = mkOption {
        type = bool;
        default = false;
        description = "Whether to focus this monitor at startup";
      };
    };
  };
in

{
  options.monitors = mkOption {
    type = attrsOf monitor;
  };

  config.lib.monitors.mainMonitorName =
    builtins.attrNames config.monitors
    |> builtins.filter (name: config.monitors.${name}.isMain)
    |> builtins.head;
  config.lib.monitors.otherMonitorsNames =
    builtins.attrNames config.monitors |> builtins.filter (name: !config.monitors.${name}.isMain);
  config.lib.monitors.mainMonitor = config.monitors.${config.lib.monitors.mainMonitorName};
}
