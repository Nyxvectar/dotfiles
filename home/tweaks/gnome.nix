{ pkgs, ... }:
{
  home.packages = with pkgs.gnomeExtensions; [
    user-themes
    blur-my-shell
    desktop-cube
    kimpanel
  ];
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "kimpanel@kde.org"
      ];
    };
    "org/gnome/mutter" = {
      "experimental-features" = [ "scale-monitor-framebuffer" ];
    };
    "org/gnome/desktop/wm/keybindings" = {
      "close" = [ "<Super>q" ];
    };
    "org/gnome/settings-daemon.plugins.media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
  };
}
