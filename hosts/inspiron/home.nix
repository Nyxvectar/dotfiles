{
  monitors = {
    "eDP-1" = {
      isMain = true;
      scale = 1.6;
      mode = {
        width = 2240;
        height = 1400;
        refresh = 60.0;
      };
      position = {
        x = 1000;
        y = 0;
      };
      rotation = 0;
      focus-at-startup = true;
    };
    "HDMI-A-1" = {
      scale = 1.6;
      mode = {
        width = 2560;
        height = 1600;
        refresh = 60.0;
      };
      position = {
        x = 0;
        y = 60;
      };
      rotation = 90;
    };
  };
  home.stateVersion = "23.11";
}
