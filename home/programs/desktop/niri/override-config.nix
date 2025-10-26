{ pkgs, config, ... }:
with config.lib.stylix.colors.withHashtag;
let
  extraConfig =
    # kdl
    '''';
  finalNiriConfig =
    builtins.replaceStrings
      [
        # "layout {"
      ]
      [
        # ''
        #   layout {
        #       blur {
        #           on
        #           passes 2
        #           radius 5
        #           noise 0.1
        #       }
        # ''
      ]
      config.programs.niri.finalConfig
    + "\n"
    + extraConfig;
in
{
  home.file.".config/niri/config-override.kdl".text = finalNiriConfig;
}
