# copied from https://github.com/nix-community/stylix/pull/1932
{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (config.lib.stylix) colors;
  colorTheme = {
    dark = with colors.withHashtag; {
      name = "Stylix generatated dark theme";
      primary = base0D;
      primaryText = base00;
      primaryContainer = base0C;
      secondary = base0E;
      surface = base01;
      surfaceText = base05;
      surfaceVariant = base02;
      surfaceVariantText = base04;
      surfaceTint = base0F;
      background = base00;
      backgroundText = base05;
      outline = base03;
      surfaceContainer = base01;
      surfaceContainerHigh = base02;
      surfaceContainerHighest = base03;
      error = base08;
      warning = base0A;
      info = base0C;
    };
    light = with colors.withHashtag; {
      name = "Stylix generatated light theme";
      primary = base0D;
      primaryText = base07;
      primaryContainer = base0C;
      secondary = base0E;
      surface = base06;
      surfaceText = base01;
      surfaceVariant = base07;
      surfaceVariantText = base02;
      surfaceTint = base0D;
      background = base07;
      backgroundText = base00;
      outline = base04;
      surfaceContainer = base06;
      surfaceContainerHigh = base05;
      surfaceContainerHighest = base04;
      error = base08;
      warning = base0A;
      info = base0C;
    };
  };
in
{
  # programs.quickshell.configs.dms =
  #   let
  #     dankMaterialShell =
  #       inputs.dankMaterialShell.packages.${pkgs.system}.dankMaterialShell.overrideAttrs
  #         {
  #           installPhase = ''
  #             mkdir -p $out/etc/xdg/quickshell/DankMaterialShell
  #             cp -r . $out/etc/xdg/quickshell/DankMaterialShell
  #             ln -s $out/etc/xdg/quickshell/DankMaterialShell $out/etc/xdg/quickshell/dms
  #             substituteInPlace $out/etc/xdg/quickshell/DankMaterialShell/Widgets/DankIcon.qml \
  #               --replace "Material Symbols Rounded" "Monofur Nerd Font"
  #           '';
  #         };
  #   in
  #   "${dankMaterialShell}/etc/xdg/quickshell/DankMaterialShell" |> lib.mkForce;
  xdg.configFile."DankMaterialShell/stylix-colors.json".text = builtins.toJSON colorTheme;
  xdg.configFile."DankMaterialShell/settings.json".text = # json
    ''
      {
        "currentThemeName": "custom",
        "customThemeFile": "/home/eden/.config/DankMaterialShell/stylix-colors.json",
        "matugenScheme": "scheme-tonal-spot",
        "dankBarTransparency": 0.5,
        "dankBarWidgetTransparency": 0.56,
        "popupTransparency": 1,
        "dockTransparency": 1,
        "use24HourClock": true,
        "useFahrenheit": false,
        "nightModeEnabled": false,
        "weatherLocation": "西湖区, 浙江省",
        "weatherCoordinates": "30.2616958,120.1256628",
        "useAutoLocation": false,
        "weatherEnabled": true,
        "showLauncherButton": true,
        "showWorkspaceSwitcher": true,
        "showFocusedWindow": true,
        "showWeather": true,
        "showMusic": true,
        "showClipboard": true,
        "showCpuUsage": true,
        "showMemUsage": true,
        "showCpuTemp": true,
        "showGpuTemp": true,
        "selectedGpuIndex": 0,
        "enabledGpuPciIds": [],
        "showSystemTray": true,
        "showClock": true,
        "showNotificationButton": true,
        "showBattery": true,
        "showControlCenterButton": true,
        "controlCenterShowNetworkIcon": true,
        "controlCenterShowBluetoothIcon": true,
        "controlCenterShowAudioIcon": true,
        "controlCenterWidgets": [
          {
            "id": "volumeSlider",
            "enabled": true,
            "width": 50
          },
          {
            "id": "brightnessSlider",
            "enabled": true,
            "width": 50
          },
          {
            "id": "wifi",
            "enabled": true,
            "width": 50
          },
          {
            "id": "bluetooth",
            "enabled": true,
            "width": 50
          },
          {
            "id": "audioOutput",
            "enabled": true,
            "width": 50
          },
          {
            "id": "audioInput",
            "enabled": true,
            "width": 50
          },
          {
            "id": "nightMode",
            "enabled": true,
            "width": 50
          },
          {
            "id": "darkMode",
            "enabled": true,
            "width": 50
          }
        ],
        "showWorkspaceIndex": false,
        "showWorkspacePadding": false,
        "showWorkspaceApps": false,
        "maxWorkspaceIcons": 3,
        "workspacesPerMonitor": true,
        "workspaceNameIcons": {},
        "waveProgressEnabled": true,
        "clockCompactMode": false,
        "focusedWindowCompactMode": false,
        "runningAppsCompactMode": true,
        "runningAppsCurrentWorkspace": false,
        "clockDateFormat": "",
        "lockDateFormat": "",
        "mediaSize": 0,
        "dankBarLeftWidgets": [
          "launcherButton",
          "workspaceSwitcher",
          "focusedWindow"
        ],
        "dankBarCenterWidgets": ["music", "clock", "weather"],
        "dankBarRightWidgets": [
          {
            "id": "systemTray",
            "enabled": true
          },
          {
            "id": "memUsage",
            "enabled": true
          },
          {
            "id": "battery",
            "enabled": true
          },
          {
            "id": "controlCenterButton",
            "enabled": true
          }
        ],
        "appLauncherViewMode": "list",
        "spotlightModalViewMode": "list",
        "networkPreference": "auto",
        "iconTheme": "System Default",
        "useOSLogo": true,
        "osLogoColorOverride": "#7daea3",
        "osLogoBrightness": 0.5,
        "osLogoContrast": 1,
        "fontFamily": "Hug Me Tight",
        "monoFontFamily": "Maple Mono",
        "fontWeight": 400,
        "fontScale": 1,
        "notepadUseMonospace": true,
        "notepadFontFamily": "",
        "notepadFontSize": 14,
        "notepadShowLineNumbers": false,
        "notepadTransparencyOverride": -1,
        "notepadLastCustomTransparency": 0.95,
        "gtkThemingEnabled": false,
        "qtThemingEnabled": false,
        "showDock": false,
        "dockAutoHide": false,
        "dockGroupByApp": false,
        "dockOpenOnOverview": false,
        "dockPosition": 2,
        "dockSpacing": 4,
        "dockBottomGap": 0,
        "cornerRadius": 12,
        "notificationOverlayEnabled": false,
        "dankBarAutoHide": false,
        "dankBarOpenOnOverview": false,
        "dankBarVisible": true,
        "dankBarSpacing": 7,
        "dankBarBottomGap": 0,
        "dankBarInnerPadding": 4,
        "dankBarSquareCorners": false,
        "dankBarNoBackground": false,
        "dankBarGothCornersEnabled": false,
        "dankBarPosition": 0,
        "lockScreenShowPowerActions": true,
        "hideBrightnessSlider": false,
        "widgetBackgroundColor": "sch",
        "surfaceBase": "s",
        "notificationTimeoutLow": 5000,
        "notificationTimeoutNormal": 5000,
        "notificationTimeoutCritical": 0,
        "notificationPopupPosition": 0,
        "osdAlwaysShowValue": false,
        "screenPreferences": {
          "wallpaper": []
        },
        "pluginSettings": {},
        "animationSpeed": 2
      }
    '';
  home.sessionVariables = {
    DMS_DISABLE_MATUGEN = "1";
  };
}
