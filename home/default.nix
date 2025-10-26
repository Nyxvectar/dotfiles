{
  pkgs,
  lib,
  user,
  config,
  ...
}:
{
  imports = [
    ./lib
    ./programs
    ./tweaks
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # files
      zip
      xz
      unzip

      # utils
      ripgrep
      zoxide
      fzf
      eza
      fd
    ];

    activation = {
      niri-transition =
        lib.hm.dag.entryAfter [ "writeBoundary" ]
          # bash
          ''
            run ${pkgs.niri-unstable}/bin/niri msg action do-screen-transition
          '';
      reload-swhkd =
        lib.hm.dag.entryAfter [ "niri-transition" ]
          # bash
          ''
            run --quiet ${pkgs.procps}/bin/pkill -HUP swhkd
          '';
      reload-shell =
        lib.hm.dag.entryAfter [ "reload-swhkd" ]
          # bash
          ''
            # only run stop if the service is active
            if ${pkgs.systemd}/bin/systemctl --user is-active waybar.service; then
              run --silence ${pkgs.systemd}/bin/systemctl --user stop waybar.service
            fi
            if ${pkgs.systemd}/bin/systemctl --user is-active dms.service; then
              run --silence ${pkgs.systemd}/bin/systemctl --user stop dms.service
            fi
            if ${pkgs.systemd}/bin/systemctl --user is-active caelestia.service; then
              run --silence ${pkgs.systemd}/bin/systemctl --user stop caelestia.service
            fi
            if ${pkgs.systemd}/bin/systemctl --user is-active noctalia-shell.service; then
              run --silence ${pkgs.systemd}/bin/systemctl --user stop noctalia-shell.service
            fi
            run --silence ${pkgs.systemd}/bin/systemctl --user start ${config.desktopShell}.service
          '';
    };
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk
        libsForQt5.fcitx5-qt
        fcitx5-chinese-addons
        fcitx5-rime
        fcitx5-pinyin-moegirl
        fcitx5-pinyin-zhwiki
      ];
      waylandFrontend = true;
    };
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Raye Lattice";
          email = "nyxvectar@proton.me";
        };
        safe = {
          directory = "*";
        };

      };
    };

    nix-index = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = false;
      enableZshIntegration = false;
    };

    home-manager.enable = true;
  };
}
