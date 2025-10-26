{
  config,
  user,
  inputs,
  pkgs,
  lib,
  ...
}:
{
  programs.noctalia-shell = {
    colors = with config.lib.stylix.colors.withHashtag; {
      mError = base08;
      mOnError = base00;
      mOnPrimary = base00;
      mOnSecondary = base01;
      mOnSurface = base05;
      mOnSurfaceVariant = base07;
      mOnTeritiary = base00;
      mOutline = base02;
      mPrimary = base0B;
      mSecondary = base0A;
      mShadow = "#000000";
      mSurface = base01;
      mSurfaceVariant = base01;
      mTeritiary = base0C;
    };
    settings = {
      setupCompleted = true;
      bar = {
        backgroundOpacity = 0.6;
        density = "comfortable";
        floating = true;
        showCapsule = true;
        widgets = {
          center = [
            {
              id = "SystemMonitor";
              showCpuTemp = true;
              showCpuUsage = true;
              showDiskUsage = false;
              showMemoryAsPercent = false;
              showMemoryUsage = true;
              showNetworkoStats = false;
            }
          ];
          left = [
            {
              id = "Workspace";
              labelMode = "none";
              hideUnoccupied = false;
            }
            {
              id = "MediaMini";
              autoHide = true;
              scrollingMode = "hover";
              showAlbumArt = true;
              showVisualizer = true;
              visualizerType = "wave";
            }
          ];
          right = [
            {
              id = "Tray";
              colorizeIcons = true;
              blacklist = [ ];
            }
            {
              id = "Volume";
              displayMode = "onhover";
            }
            {
              id = "Battery";
              displayMode = "alwaysShow";
              warningThreshold = 30;
            }
            {
              id = "Clock";
              customFont = "Monofur Nerd Font Mono";
              formatHorizontal = "HH:mm ddd, MMM dd";
              formatVertical = "HH mm - dd MM";
              useCustomFont = true;
              usePrimaryColor = true;
            }
            {
              id = "ControlCenter";
              customIconPath = "";
              icon = "";
              useDistroLogo = false;
            }
          ];
        };
      };
      colorSchemes = {
        generateTemplatesForPredefined = false;
        useWallpaperColors = false;
      };
      general = {
        avatarImage = "/home/${user}/.face";
        dimDesktop = true;
        forceBlackScreenCorners = true;
        showScreenCorners = true;
      };
      location = {
        name = "西湖";
      };
      ui = {
        fontDefault = "Hug Me Tight";
        fontFixed = "Maple Mono";
      };
      wallpaper.enabled = false;
    };
  };

  systemd.user.services = lib.mkIf (config.desktopShell == "noctalia-shell") {
    noctalia-shell =
      let
        noctaliaPackage = inputs.noctalia-shell.packages.${pkgs.system}.default;
        noctaliaConfig = "/home/${user}/.config/noctalia/gui-settings.json";
      in
      {
        Unit = {
          After = [ "graphical-session.target" ];
          PartOf = [ "graphical-session.target" ];
          StartLimitIntervalSec = 60;
          StartLimitBurst = 3;
          X-Restart-Triggers = [
            noctaliaPackage
            noctaliaConfig
          ];
        };
        Install.WantedBy = [ "graphical-session.target" ];
        Service = {
          ExecStart = "${noctaliaPackage}/bin/noctalia-shell";
          Restart = "on-failure";
          RestartSec = 3;
          TimeoutStartSec = 10;
          TimeoutStopSec = 5;
          Environment = [
            "NOCTALIA_SETTINGS_FALLBACK=${noctaliaConfig}"
          ];
        };
      };
  };
}
