{
  config,
  pkgs,
  ...
}:
{
  xdg.configFile."zathura/stylix".text = with config.lib.stylix.colors.withHashtag; ''
    set default-fg                "${base05}"
    set default-bg                "${base00}"

    set completion-bg             "${base02}"
    set completion-fg             "${base05}"
    set completion-highlight-bg   "${base01}"
    set completion-highlight-fg   "${base05}"
    set completion-group-bg       "${base02}"
    set completion-group-fg       "${base0D}"

    set statusbar-fg              "${base05}"
    set statusbar-bg              "${base02}"

    set notification-bg           "${base02}"
    set notification-fg           "${base05}"
    set notification-error-bg     "${base02}"
    set notification-error-fg     "${base08}"
    set notification-warning-bg   "${base02}"
    set notification-warning-fg   "${base0A}"

    set inputbar-fg               "${base05}"
    set inputbar-bg               "${base02}"

    set recolor-lightcolor        "${base00}"
    set recolor-darkcolor         "${base05}"

    set index-fg                  "${base05}"
    set index-bg                  "${base00}"
    set index-active-fg           "${base05}"
    set index-active-bg           "${base02}"

    set render-loading-bg         "${base00}"
    set render-loading-fg         "${base05}"

    set highlight-color           "${base01}"
    set highlight-fg              "${base0E}"
    set highlight-active-color    "${base0E}"
  '';
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    extraConfig = ''
      include stylix

      set selection-clipboard clipboard

      set recolor true

      set font '${config.stylix.fonts.monospace.name}'
    '';
  };
}
