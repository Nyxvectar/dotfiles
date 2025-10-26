{ user, config, ... }:
{
  xdg.configFile."swhkd/basic.swhkdrc".text = config.lib.swhkd.mkSwhkdrc {
    keyBindings = [
      {
        key = "super + shift + r";
        command = "pkill -HUP swhkd";
      }
      {
        key = "super + alt + c";
        command = "wl-color-picker";
      }
      {
        key = "super + b";
        command =
          {
            waybar = "pkill -USR1 .waybar-wrapped";
            dms = "dms ipc call bar toggle";
            caelestia = "echo pass";
            noctalia-shell = "noctalia-shell ipc call bar toggle";
          }
          .${config.desktopShell};
      }
      {
        key = "XF86AudioMute";
        command = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      }
      {
        key = "XF86AudioMicMute";
        command = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      }
      {
        key = "XF86AudioRaiseVolume";
        command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
      }
      {
        key = "XF86AudioLowerVolume";
        command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
      }
      {
        key = "super + shift + s";
        command =
          with config.lib.stylix.colors.withHashtag;
          ''wshowkeys -a bottom -a right -F "Comic Code 30" -b "${base00}aa" -f "${base0E}ee" -s "${base0F}ee" -t 1'';
      }
      {
        key = "super + e";
        command = "hexecute";
      }
    ];
  };
  xdg.configFile."swhkd/tofi.swhkdrc".text = config.lib.swhkd.mkSwhkdrc {
    keyBindings = [
      {
        key = "super + x";
        command = "/home/${user}/scripts/tofi/powermenu";
      }
      {
        key = "super + shift + p";
        command = "sh -c $(tofi-drun)";
      }
    ];
  };
}
