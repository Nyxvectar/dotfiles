{
  programs = {
    fish.enable = true;
    adb.enable = true;
    light.enable = true;
    wshowkeys.enable = true;
    nix-ld.enable = true;
    virt-manager.enable = true;
    git = {
      enable = true;
      config = {
        safe = {
          directory = "*";
        };
      };
    };
  };
}
