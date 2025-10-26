{
  programs.chromium = {
    enable = true;
    commandLineArgs = [ "--wayland-text-input-version=3" ];
  };
}
