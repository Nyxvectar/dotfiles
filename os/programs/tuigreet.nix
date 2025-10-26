{ config, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = # bash
        let
          inherit (config.services.displayManager.sessionData) desktops;
        in
        # bash
        ''
          ${pkgs.tuigreet}/bin/tuigreet --time \
            --sessions ${desktops}/share/xsessions:${desktops}/share/wayland-sessions \
            --remember --remember-user-session --asterisks --cmd niri-session \
            --user-menu --greeting "Who TF Are You?" --window-padding 2'';
      user = "greeter";
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
