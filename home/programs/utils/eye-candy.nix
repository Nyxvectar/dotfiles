{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    cmatrix
    cbonsai
  ];
  programs.fastfetch.enable = true;
  xdg.configFile."fastfetch/config.jsonc".source = ./fastfetch.jsonc;
  home.file.".face".source = config.lib.wallpapers.goNord {
    name = "face";
    path = pkgs.fetchurl {
      name = "face.jpg";
      url = "https://avatars.githubusercontent.com/EdenQwQ";
      sha256 = "1hxl459l3ni5yaj72dngy9wx9rd1yvb85v31nibv5mih4mp1p6cp";
    };
  };
}
