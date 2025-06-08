{ config, pkgs, ... }:

{
  # 启用 Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    # 环境变量设置
    env = [
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XCURSOR_SIZE,32"
      "WLR_DRM_NO_ATOMIC,1"
      "XMODIFIERS,@im=fcitx"
      "SDL_IM_MODULE,fcitx"
      "QT_IM_MODULE,fcitx"
      "HYPRCURSOR_THEME,rose-pine-hyprcursor"
      "QT_QPA_PLATFORMTHEME,qt6ct"
    ];

    # 启动时执行的命令
    execOnce = [
      "hyprpaper"
      "waybar"
      "export GOPROXY=https://goproxy.io,direct"
      "dbus-update-activation-environment --systemd --all"
      "bash ~/.config/hypr/scripts/gaokao.sh"
      "fcitx5"
      "hyprctl setcursor rose-pine-hyprcursor 28"
      "gsettings set org.gnome.desktop.interface color-scheme prefer-dark"
    ];

    # 主配置
    settings = {
      monitor = [ ",highres,auto,1" ];

      xwayland.force_zero_scaling = true;

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
        tablet = {
          region_position = "1080 540";
          region_size = "2160 1080";
        };
        numlock_by_default = true;
        sensitivity = 0;
        accel_profile = "flat";
      };

      general = {
        gaps_in = 4;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa) rgba(727272aa) 45deg";
        allow_tearing = true;
        layout = "dwindle";
      };

      decoration = {
        rounding = 16;
        blur = {
          enabled = true;
          size = 0;
          passes = 0;
          contrast = 2;
        };
      };

      animations = {
        enabled = true;
        bezier = [ "myBezier,0.05,0.9,0.1,1.05" ];
        animation = [
          "windowsMove,1,7,myBezier"
          "windowsIn,1,3,default,popin 90%"
          "windowsOut,1,2,default,popin 95%"
          "border,1,3,default"
          "fade,1,3,default"
          "workspaces,1,5,default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        split_width_multiplier = 1.4;
      };

      misc = {
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
      };

      # 窗口规则
      windowrulev2 = [
        "float,title:(Volume Control)"
        "float,class:(steam)"
        "float,class:(QQ)"
        "float,class:(WhatsApp Desktop)"
        "float,title:(Qt5 Configuration Tool)"
        "float,title:(Qt6 Configuration Tool)"
        "float,title:(Fcitx Configuration)"
        "float,class:(org.gnome.Nautilus)"
        "float,class:(org.gnome.Calculator)"
        "float,class:(firefox),title:(Library)"
        "float,class:(Firefox Developer Edition),title:(Library)"
        "float,class:(vlc)"
        "float,class:(mpv)"
        "float,class:(qemu.*)"
        "float,class:(org.telegram.desktop),title:(Media viewer)"
        "opacity 1.0,class:(cloudmusic.exe),title:(^$)"
        "immediate,class:^(Celeste.bin.x86_64)$"
        "immediate,class:^(KSP.x86_64)$"
      ];

      # 图层规则
      layerrule = [
        "blur,notifications"
        "ignorezero,notifications"
        "blur,launcher"
        "ignorezero,launcher"
      ];

      # 按键绑定
      bind = [
        # 功能键
        ",xf86audiolowervolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-"
        ",xf86audioraisevolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+"
        ",xf86audiomute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",xf86audiomicmute,exec,pactl -- set-source-mute @DEFAULT_SOURCE@ toggle"
        ",xf86monbrightnessdown,exec,blight -d backlight/amdgpu_bl1 set -25.5"
        ",xf86monbrightnessup,exec,blight -d backlight/amdgpu_bl1 set +25.5"

        # 应用快捷键
        "$mainMod,D,killactive"
        "$mainMod,A,exec,alacritty"
        "$mainMod,W,exec,nautilus --new-window"
        "$mainMod,V,togglefloating"
        "$mainMod,Q,exec,rofi -show drun"
        "$mainMod,O,pseudo" # dwindle
        "$mainMod,Y,exec,kitty"
        "$mainMod,P,togglesplit" # dwindle
        "$mainMod,F,fullscreen"
        "$mainMod,E,exec,firefox"
        "$mainMod,I,exec,hyprlock"

        # 系统工具
        "CTRL SHIFT,TAB,exec,missioncenter"
        "CTRL SHIFT,F12,exec,gnome-system-monitor"
        "$mainMod SHIFT,H,exit"

        # 应用启动
        "$mainMod SHIFT,M,exec,spotify"
        "$mainMod SHIFT,D,exec,discord"
        "$mainMod SHIFT,T,exec,telegram-desktop"
        "$mainMod SHIFT,Q,exec,qq"
        "$mainMod SHIFT,A,exec,wechat-uos"

        # 截图
        "$mainMod SHIFT,S,exec,grim -g \"$(slurp)\" - | wl-copy"

        # 窗口导航
        "ALT,left,movefocus,l"
        "ALT,right,movefocus,r"
        "ALT,up,movefocus,u"
        "ALT,down,movefocus,d"

        # 工作区切换
        "$mainMod,TAB,workspace,previous"
        "$mainMod,1,workspace,1"
        "$mainMod,2,workspace,2"
        "$mainMod,3,workspace,3"
        "$mainMod,4,workspace,4"
        "$mainMod,5,workspace,5"
        "$mainMod,6,workspace,6"
        "$mainMod,7,workspace,7"
        "$mainMod,8,workspace,8"
        "$mainMod,9,workspace,9"
        "$mainMod,0,workspace,10"

        # 移动窗口到工作区
        "$mainMod SHIFT,1,movetoworkspace,1"
        "$mainMod SHIFT,2,movetoworkspace,2"
        "$mainMod SHIFT,3,movetoworkspace,3"
        "$mainMod SHIFT,4,movetoworkspace,4"
        "$mainMod SHIFT,5,movetoworkspace,5"
        "$mainMod SHIFT,6,movetoworkspace,6"
        "$mainMod SHIFT,7,movetoworkspace,7"
        "$mainMod SHIFT,8,movetoworkspace,8"
        "$mainMod SHIFT,9,movetoworkspace,9"
        "$mainMod SHIFT,0,movetoworkspace,10"
        "$mainMod SHIFT,left,movetoworkspace,e-1"
        "$mainMod SHIFT,right,movetoworkspace,e+1"

        # 鼠标工作区切换
        "$mainMod,mouse_down,workspace,e+1"
        "$mainMod,mouse_up,workspace,e-1"
        "$mainMod,left,workspace,e-1"
        "$mainMod,right,workspace,e+1"
      ];

      # 鼠标绑定
      bindm = [
        "$mainMod,mouse:272,movewindow"
        "$mainMod,mouse:273,resizewindow"
      ];

      # 特殊设置
      binds = {
        workspace_back_and_forth = false;
        allow_workspace_cycles = true;
      };

      # 主修饰键定义
      "$mainMod" = "SUPER";
    };
  };
}