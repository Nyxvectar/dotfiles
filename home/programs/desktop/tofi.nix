{
  config,
  pkgs,
  ...
}:
with config.lib.stylix.colors;
{
  home.packages = with pkgs; [
    tofi
  ];
  xdg.configFile."tofi/config".text = ''
    # Font
    # font = Fredoka medium
    font = Hug Me Tight Regular
    font-size = 10

    # Window Style
    horizontal = true
    anchor = top
    width = 98%
    height = 40
    margin-top = 10
    margin-left = 1%
    margin-right = 1%

    outline-width = 0
    border-width = 0
    corner-radius = 12
    min-input-width = 60
    result-spacing = 15
    padding-top = 7
    padding-bottom = 0
    padding-left = 10
    padding-right = 0

    # Text style
    prompt-text = "Can I have a"
    prompt-padding = 15

    background-color = #${base00}
    text-color = #${base05}

    prompt-color = #${base00}
    prompt-background = #${base0B}
    prompt-background-padding = 2, 5
    prompt-background-corner-radius = 6

    input-color = #${base00}
    input-background = #${base07}
    input-background-padding = 2, 5
    input-background-corner-radius = 6

    alternate-result-color = #${base00}
    alternate-result-background = #${base0A}
    alternate-result-background-padding = 2, 5
    alternate-result-background-corner-radius = 6

    selection-color = #${base00}
    selection-background = #${base0E}
    selection-background-padding = 2, 5
    selection-background-corner-radius = 6
    selection-match-color = #${base00}

    clip-to-padding = false

    history = true
  '';
  xdg.configFile."tofi/config-full".text = ''
    width = 100%
    height = 100%
    border-width = 0
    outline-width = 0
    padding-left = 35%
    padding-top = 35%
    result-spacing = 25
    num-results = 5
    # font = Comic Mono Nerd Font
    font = Hug Me Tight
    prompt-padding = 15
    background-color = #${base00}aa
    text-color = #${base05}
    prompt-color = #${base0B}
    selection-color = #${base0E}
  '';
}
