{
  pkgs,
  ...
}:
{
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      window_padding_width = "10 20 10 20";
      cursor_trail = 1;
      cursor_trail_start_threshold = 0;
      bold_font = "family='Maple Mono' style=ExtraBold variable_name=MapleMono";
    };
    extraConfig = ''
      map ctrl+shift+p kitten hints --type path --program @
      map ctrl+shift+s kitten hints --type word --program @
      map ctrl+shift+l kitten hints --type line --program @

      symbol_map U+4E00-U+9FFF   Xiaolai Mono SC
      symbol_map U+3400-U+4DBF   Xiaolai Mono SC
      symbol_map U+20000-U+2A6DF Xiaolai Mono SC
      symbol_map U+2A700-U+2B73F Xiaolai Mono SC
      symbol_map U+2B740-U+2B81F Xiaolai Mono SC
      symbol_map U+2B820-U+2CEAF Xiaolai Mono SC
      symbol_map U+2CEB0-U+2EBEF Xiaolai Mono SC
      symbol_map U+30000-U+3134F Xiaolai Mono SC
      symbol_map U+F900-U+FAFF   Xiaolai Mono SC
      symbol_map U+2F800-U+2FA1F Xiaolai Mono SC

      symbol_map  U+E000-U+E00D Symbols Nerd Font
      symbol_map U+e0a0-U+e0a2,U+e0b0-U+e0b3 Symbols Nerd Font
      symbol_map U+e0a3-U+e0a3,U+e0b4-U+e0c8,U+e0cc-U+e0d2,U+e0d4-U+e0d4 Symbols Nerd Font
      symbol_map U+e5fa-U+e62b Symbols Nerd Font
      symbol_map U+e700-U+e7c5 Symbols Nerd Font
      symbol_map U+f000-U+f2e0 Symbols Nerd Font
      symbol_map U+e200-U+e2a9 Symbols Nerd Font
      symbol_map U+f400-U+f4a8,U+2665-U+2665,U+26A1-U+26A1,U+f27c-U+f27c Symbols Nerd Font
      symbol_map U+F300-U+F313 Symbols Nerd Font
      symbol_map U+23fb-U+23fe,U+2b58-U+2b58 Symbols Nerd Font
      symbol_map U+f500-U+fd46 Symbols Nerd Font
      symbol_map U+e300-U+e3eb Symbols Nerd Font
      symbol_map U+21B5,U+25B8,U+2605,U+2630,U+2632,U+2714,U+E0A3,U+E615,U+E62B Symbols Nerd Font
    '';
  };
  stylix.targets.kitty.enable = true;
  home.packages = with pkgs; [
    termpdfpy
    mdcat
  ];
}
