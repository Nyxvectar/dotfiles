{
  pkgs,
  user,
  ...
}:
{
  imports = [
    ./boot.nix
  ];

  networking.networkmanager.enable = true;

  time = {
    timeZone = "Asia/Shanghai";
    hardwareClockInLocalTime = true;
  };

  i18n = {
    extraLocaleSettings = {
      LANGUAGE = "en_US.UTF-8";
      LC_ALL = "en_US.UTF-8";
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  services = {
    displayManager.gdm.enable = false;
    desktopManager.gnome.enable = true;

    xserver = {
      enable = true;
      desktopManager.runXdgAutostartIfNone = true;
      xkb.layout = "us";
      xkb.variant = "";
    };

    fprintd = {
      enable = true;
    };

    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    blueman.enable = true;

    gnome.gnome-browser-connector.enable = true;

    gvfs.enable = true;

    openssh.enable = true;

    dae = {
      enable = true;
      configFile = "/home/${user}/.config/dae/config.dae";
    };
  };

  security = {
    rtkit.enable = true;
    sudo.extraRules = [
      {
        users = [ user ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];

    polkit.enable = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  documentation.man.generateCaches = true;

  users.users.${user} = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "Eden Lee";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbuser"
      "docker"
      "libvirtd"
      "video"
      "kvm"
    ];
    packages = with pkgs; [
      nautilus
      loupe
      podman-compose
    ];
  };

  environment = {
    systemPackages = with pkgs; [
      git
      gcc
      wget
      curl
      gnumake
      cmake
      ntfs3g
      base16-schemes
      home-manager
      polkit
      polkit_gnome
    ];

    variables = {
      EDITOR = "lvim";
      GDK_SCALE = "";
      GDK_DPI_SCALE = "";
      NIRI_CONFIG = "/home/${user}/.config/niri/config-override.kdl";
    };

    sessionVariables = {
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
      QT_SCALE_FACTOR_ROUNDING_POLICY = "round";
      GSK_RENDERER = "vulkan";
      NIXOS_OZONE_WL = "1";
    };

    localBinInPath = true;
  };

  systemd.user.services = {
    polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
    niri-flake-polkit.enable = false;
  };

  virtualisation = {
    libvirtd.enable = true;

    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    docker = {
      enable = true;
      storageDriver = "btrfs";
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    oci-containers.backend = "docker";
  };
}
