{ config, user, ... }:
{
  imports = [
    ./swhkd.nix
    ./waybar.nix
  ];

  wayland.windowManager.mango = {
    enable = true;
    settings =
      with config.lib.stylix.colors;
      ''
        rootcolor=0x${base00}ff
        bordercolor=0x${base02}ff
        focuscolor=0x${base0E}ff
        maxmizescreencolor=0x${base0C}ff
        urgentcolor=0x${base08}ff
        scratchpadcolor=0x${base0A}ff
        globalcolor=0x${base0D}ff
      ''
      + ''
            blur=1
        blur_optimized=0
        blur_params_radius=10

        shadows=1
        shadows_size=5
        shadows_position_x=0
        shadows_position_y=0

        border_radius=10

        focused_opacity=0.95
        unfocused_opacity=0.8

        # Animation Configuration
        animations=1
        layer_animations=1
        animation_type_open=zoom
        animation_type_close=slide
        animation_fade_in=1
        zoom_initial_ratio=0.5
        fadein_begin_opacity=0.5
        fadeout_begin_opacity=0.8
        animation_duration_move=500
        animation_duration_open=400
        animation_duration_tag=350
        animation_duration_close=800
        animation_curve_open=0.46,1.0,0.29,1
        animation_curve_move=0.46,1.0,0.29,1
        animation_curve_tag=0.46,1.0,0.29,1
        animation_curve_close=0.08,0.92,0,1
        tag_animation_direction=0

        # Scroller Layout Setting
        scroller_structs=20
        scroller_default_proportion=0.8
        scoller_focus_center=0
        scroller_proportion_preset=0.5,0.8,1.0

        # Master-Stack Layout Setting (tile,spiral,dwindle)
        new_is_master=0
        default_mfact=0.55
        default_nmaster=1
        smartgaps=0
        # only work in spiral and dwindlw
        default_smfact=0.5 


        # Overview Setting
        hotarea_size=10
        enable_hotarea=1
        ov_tab_mode=0
        overviewgappi=5
        overviewgappo=30

        # Misc
        focus_cross_tag=0
        focus_cross_monitor=0
        axis_bind_apply_timeout=100
        focus_on_activate=1
        bypass_surface_visibility=0
        sloppyfocus=1
        warpcursor=1

        # keyboard
        repeat_rate=25
        repeat_delay=600
        numlockon=1
          
        # Trackpad 
        tap_to_click=1
        tap_and_drag=1
        drag_lock=1
        natural_scrolling=0
        disable_while_typing=1
        left_handed=0
        middle_button_emulation=0

        # Appearance
        gappih=5
        gappiv=5
        gappoh=10
        gappov=10
        borderpx=4

        # layout circle limit
        # if not set, it will circle all layout
        # circle_layout=spiral,scroller

        # tags rule
        # layout support: tile,scroller,grid,monocle,spiral,dwindle
        tags=id:1,layout_name:scroller
        tags=id:2,layout_name:scroller
        tags=id:3,layout_name:scroller
        tags=id:4,layout_name:scroller
        tags=id:5,layout_name:scroller
        tags=id:6,layout_name:scroller
        tags=id:7,layout_name:scroller
        tags=id:8,layout_name:scroller
        tags=id:9,layout_name:scroller

        # Window Rules
        # appid: type-string if match it or title, the rule match   
        # title: type-string if match it or appid, the rule match  
        # tags: type-num(1-9)
        # isfloating: type-num(0 or 1)
        # isfullscreen: type-num(0 or 1)
        # scroller_proportion: type-float(0.1-1.0)
        # animation_type_open : type-string(zoom,slide,none)
        # animation_type_close : type-string(zoom,slide)
        # isnoborder : type-num(0 or 1)
        # monitor  : type-int(0-99999)
        # width : type-num(0-9999)
        # height : type-num(0-9999)
        # isterm : type-num (0 or 1) -- when new window open, will replace it, and will restore after the sub window exit
        # nnoswallow : type-num(0 or 1) -- if enable, this window wll not replace isterm window when it was open by isterm window
        # globalkeybinding: type-string(for example-- alt-l or alt+super-l)

        # example
        # windowrule=isfloating:1,appid:yesplaymusic
        # windowrule=width:1500,appid:yesplaymusic
        # windowrule=height:900,appid:yesplaymusic
        # windowrule=isfloating:1,title:qxdrag
        # windowrule=isfloating:1,appid:Rofi
        # windowrule=isfloating:1,appid:wofi
        # windowrule=isnoborder:1,appid:wofi
        # windowrule=animation_type_open:zoom,appid:wofi
        # windowrule=globalkeybinding:ctrl+alt-o,appid:com.obsproject.Studio
        # windowrule=globalkeybinding:ctrl+alt-n,appid:com.obsproject.Studio
        windowrule=isfloating:1,appid:yad
        windowrule=globalkeybinding:ctrl+alt-a,appid:com.obsproject.Studio
        windowrule=globalkeybinding:ctrl+alt-s,appid:com.obsproject.Studio
        windowrule=scroller_proportion:1.0,appid:kitty
        windowrule=scroller_proportion:1.0,appid:firefox

        # open in specific tag
        # windowrule=tags:4,appid:Google-chrome
        # windowrule=tags:3,appid:QQ
        # windowrule=tags:5,appid:yesplaymusic
        # windowrule=tags:2,appid:mpv
        # windowrule=tags:6,appid:obs

        # Monitor Rules
        # name|mfact|nmaster|scale|layout|(rotate or reflect)|x|y
        # rotate or reflect:
        # 0:no transform
        # 1:90 degrees counter-clockwise
        # 2:180 degrees counter-clockwise
        # 3:270 degrees counter-clockwise
        # 4:180 degree flip around a vertical axis
        # 5:flip and rotate 90 degrees counter-clockwise
        # 6:flip and rotate 180 degrees counter-clockwise
        # 7:flip and rotate 270 degrees counter-clockwise

        # example
        monitorrule=eDP-1,0.55,1,scroller,0,1.6,1000,0
        monitorrule=HDMI-A-1,0.55,1,scroller,1,1.6,0,0

        # Key Bindings
        # The mod key is not case sensitive, 
        # but the second key is case sensitive, 
        # if you use shift as one of the mod keys, 
        # remember to use uppercase keys

        # reload config
        bind=SUPER+CTRL,r,reload_config


        # menu and terminal
        bind=SUPER,p,spawn,sh -c \$(tofi-run)
        bind=SUPER,Return,spawn,kitty
        bind=SUPER+SHIFT,C,spawn,/home/eden/scripts/tofi/colorscheme
        bind=SUPER+SHIFT,W,spawn,/home/eden/scripts/change-wal-wayland

        # exit
        bind=SUPER,q,killclient,

        # switch window focus
        bind=SUPER,h,focusdir,left
        bind=SUPER,l,focusdir,right
        bind=SUPER,k,focusdir,up
        bind=SUPER,j,focusdir,down

        # swap window
        bind=SUPER+SHIFT,K,exchange_client,up
        bind=SUPER+SHIFT,J,exchange_client,down
        bind=SUPER+SHIFT,H,exchange_client,left
        bind=SUPER+SHIFT,L,exchange_client,right

        # switch window status
        bind=SUPER,g,toggleglobal,
        bind=SUPER,Tab,toggleoverview,
        bind=SUPER+SHIFT,space,togglefloating,
        bind=SUPER,m,togglemaxmizescreen,
        bind=SUPER+SHIFT,F,togglefullscreen,
        bind=SUPER,i,minized,
        bind=SUPER+SHIFT,I,restore_minized
        bind=ALT,z,toggle_scratchpad

        # scroller layout
        bind=SUPER,f,set_proportion,1.0
        bind=SUPER,r,switch_proportion_preset,


        # tile layout
        bind=SUPER,e,incnmaster,1
        bind=SUPER,t,incnmaster,-1
        bind=ALT+CTRL,Left,setmfact,-0.01
        bind=ALT+CTRL,Right,setmfact,+0.01
        bind=ALT+CTRL,Up,setsmfact,-0.01
        bind=ALT+CTRL,Down,setsmfact,+0.01
        bind=ALT,s,zoom,


        # switch layout
        bind=CTRL+SUPER,t,setlayout,tile
        bind=CTRL+SUPER,s,setlayout,scroller
        bind=SUPER,n,switch_layout


        # tag switch
        bind=SUPER,Left,viewtoleft,
        bind=CTRL,Left,viewtoleft_have_client,
        bind=SUPER,Right,viewtoright,
        bind=CTRL,Right,viewtoright_have_client,
        bind=CTRL+SUPER,Left,tagtoleft,
        bind=CTRL+SUPER,Right,tagtoright,

        # normal num key  is (1-9)
        # right-side keyboard num keys is (KP_1-KP_9)
        bind=SUPER,1,view,1
        bind=SUPER,2,view,2
        bind=SUPER,3,view,3
        bind=SUPER,4,view,4
        bind=SUPER,5,view,5
        bind=SUPER,6,view,6
        bind=SUPER,7,view,7
        bind=SUPER,8,view,8
        bind=SUPER,9,view,9

        bind=SUPER+SHIFT,exclam,tag,1
        bind=SUPER+SHIFT,at,tag,2
        bind=SUPER+SHIFT,numbersign,tag,3
        bind=SUPER+SHIFT,dollar,tag,4
        bind=SUPER+SHIFT,percent,tag,5
        bind=SUPER+SHIFT,asciicircum,tag,6
        bind=SUPER+SHIFT,ampersand,tag,7
        bind=SUPER+SHIFT,asterisk,tag,8
        bind=SUPER+SHIFT,parenleft,tag,9

        bind=SUPER+CTRL+SHIFT,exclam,toggletag,1
        bind=SUPER+CTRL+SHIFT,at,toggletag,2
        bind=SUPER+CTRL+SHIFT,numbersign,toggletag,3
        bind=SUPER+CTRL+SHIFT,dollar,toggletag,4
        bind=SUPER+CTRL+SHIFT,percent,toggletag,5
        bind=SUPER+CTRL+SHIFT,asciicircum,toggletag,6
        bind=SUPER+CTRL+SHIFT,ampersand,toggletag,7
        bind=SUPER+CTRL+SHIFT,asterisk,toggletag,8
        bind=SUPER+CTRL+SHIFT,parenleft,toggletag,9

        bind=SUPER+CTRL,1,toggleview,1
        bind=SUPER+CTRL,2,toggleview,2
        bind=SUPER+CTRL,3,toggleview,3
        bind=SUPER+CTRL,4,toggleview,4
        bind=SUPER+CTRL,5,toggleview,5
        bind=SUPER+CTRL,6,toggleview,6
        bind=SUPER+CTRL,7,toggleview,7
        bind=SUPER+CTRL,8,toggleview,8
        bind=SUPER+CTRL,9,toggleview,9

        # monitor switch
        bind=SUPER+CTRL,h,focusmon,left
        bind=SUPER+CTRL,l,focusmon,right
        bind=SUPER+CTRL+SHIFT,H,tagmon,left
        bind=SUPER+CTRL+SHIFT,L,tagmon,right

        # gaps
        bind=ALT+SHIFT,X,incgaps,1
        bind=ALT+SHIFT,Z,incgaps,-1
        bind=ALT+SHIFT,R,togglegaps

        #custom app bind example
        # spawn_on_empty (if tag 4 is empty , open app in this,otherwise view to tag 4)
        # bind=SUPER,Return,spawn_on_empty,google-chrome,4
        # spawn
        # bind=CTRL+ALT,Return,spawn,st -e ~/tool/ter-multiplexer.sh

        # Mouse Button Bindings
        # NONE mode key only work in ov mode
        mousebind=SUPER,btn_left,moveresize,curmove
        mousebind=NONE,btn_middle,togglemaxmizescreen,0
        mousebind=ALT,btn_left,moveresize,curresize
        mousebind=NONE,btn_left,toggleoverview,-1
        mousebind=NONE,btn_right,killclient,0

        gesturebind=NONE,left,3,focusdir,left
        gesturebind=NONE,right,3,focusdir,right
        gesturebind=NONE,up,3,focusdir,up
        gesturebind=NONE,down,3,focusdir,down
        gesturebind=NONE,left,4,viewtoleft_have_client
        gesturebind=NONE,right,4,viewtoright_have_client
        gesturebind=NONE,up,4,toggleoverview
        gesturebind=NONE,down,4,toggleoverview

        # Axis Bindings
        axisbind=SUPER,UP,viewtoleft_have_client
        axisbind=SUPER,DOWN,viewtoright_have_client
      '';
    autostart_sh =
      let
        setWallpaper = monitor: ''
          swww img --namespace background -o ${monitor} ~/Pictures/Wallpapers/generated/$(cat ~/.cache/swww/${monitor} | cut -d'/' -f7 | cut -d'-' -f2- | sd "\-blurred" "")
        '';
      in
      ''
        killall swhkd
        killall swhks
        swhks &
        doas swhkd -c ~/.config/mango/swhkdrc &
        swww kill
        swww-daemon --namespace background &
        killall clash-meta
        clash-meta -d ~/.config/clash &
        wlsunset -s 00:00 -S 00:00 -t 5000 -T 5001 &
        killall .waybar-wrapped
        waybar -c ~/.config/mango/waybar/config.jsonc -s ~/.config/mango/waybar/style.css &
        killall .nm-applet-wrap
        killall .blueman-applet
        fcitx5 -d -r &
        nm-applet &
        blueman-applet &
      ''
      + (builtins.attrNames config.monitors |> map setWallpaper |> builtins.concatStringsSep "\n");
  };
}
