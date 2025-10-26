{ user, ... }:
{
  xdg.configFile."mango/swhkdrc".text = ''
    include /home/${user}/.config/swhkd/basic.swhkdrc
    include /home/${user}/.config/swhkd/tofi.swhkdrc
  '';
}
