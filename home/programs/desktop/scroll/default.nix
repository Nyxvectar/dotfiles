{ config, ... }:
let
  outputConf =
    builtins.attrNames config.monitors
    |> map (
      name:
      with config.monitors.${name};
      "output ${name} resolution ${toString mode.width}x${toString mode.height} position ${toString position.x},${toString position.y} scale ${toString scale} transform ${360 - rotation |> toString}"
    )
    |> builtins.concatStringsSep "\n";
in
{
  xdg.configFile."scroll/config".text = with config.lib.stylix.colors; ''
    # Default config for scroll
    #
    # Copy this to ~/.config/scroll/config and edit it to your liking.
    #
    # Read `man 5 scroll` for a complete reference.

    ### Variables
    #
    # Logo key. Use Mod1 for Alt.
    set $mod Mod4
    # Home row direction keys, like vim
    set $left h
    set $down j
    set $up k
    set $right l
    # Your preferred terminal emulator
    set $term kitty
    # Your preferred application launcher
    set $menu sh -c $(tofi-run)

    ### Output configuration
    #
    # Default wallpaper (more resolutions are available in @datadir@/backgrounds/scroll/)
    # output * bg @datadir@/backgrounds/scroll/Sway_Wallpaper_Blue_1920x1080.png fill
    #
    # Example configuration:
    #
    #   output HDMI-A-1 resolution 1920x1080 position 1920,0
    #
    # You can get the names of your outputs by running: scrollmsg -t get_outputs
    ${outputConf}
    # output HDMI-A-1 resolution 2560x1600 position 0,60 scale 1.6 transform 270
    # output eDP-1 resolution 2240x1400 position 1000,0 scale 1.6

    ### Idle configuration
    #
    # Example configuration:
    #
    # exec swayidle -w \
    #          timeout 300 'swaylock -f -c 000000' \
    #          timeout 600 'scrollmsg "output * power off"' resume 'scrollmsg "output * power on"' \
    #          before-sleep 'swaylock -f -c 000000'
    #
    # This will lock your screen after 300 seconds of inactivity, then turn off
    # your displays after another 300 seconds, and turn your screens back on when
    # resumed. It will also lock your screen before your computer goes to sleep.

    ### Input configuration
    #
    # Example configuration:
    #
    #   input "2:14:SynPS/2_Synaptics_TouchPad" {
    #       dwt enabled
    #       tap enabled
    #       natural_scroll enabled
    #       middle_emulation enabled
    #   }
    #
    # You can get the names of your inputs by running: scrollmsg -t get_inputs
    # Read `man 5 scroll-input` for more information about this section.
    input "1267:12815:VEN_04F3:00_04F3:320F_Touchpad" {
      tap enabled
      drag_lock disabled
    }

    ### Windows defaults
    default_border pixel 4
    gaps inner 5
    gaps outer 5
    client.focused ${base0E} ${base01} ${base05} ${base0A} ${base0E}
    client.focused_inactive ${base03} ${base01} ${base05} ${base0A} ${base03}
    client.unfocused ${base03} ${base01} ${base05} ${base0A} ${base03}

    # Idle inhibit for fullscreen windows
    for_window [all] inhibit_idle fullscreen

    # Layout settings
    layout_default_width 0.666666667
    layout_default_height 1.0
    layout_widths [0.33333333 0.5 0.666666667 1.0]
    layout_heights [0.33333333 0.5 0.666666667 1.0]

    fullscreen_movefocus true

    ### Key bindings
    #
    # Basics:
    #
        # Start a terminal
        bindsym $mod+Return exec $term

        # Kill focused window
        bindsym $mod+q kill

        # Start your launcher
        bindsym $mod+p exec $menu
        
        # Drag floating windows by holding down $mod and left mouse button.
        # Resize them with right mouse button + $mod.
        # Despite the name, also works for non-floating windows.
        # Change normal to inverse to use left mouse button for resizing and right
        # mouse button for dragging.
        floating_modifier $mod normal

        # Reload the configuration file
        bindsym $mod+Shift+c reload

        # Exit scroll (logs you out of your Wayland session)
        bindsym $mod+Shift+x exec scrollnag -t warning -m 'You pressed the exit shortcut. Do you really want to exit scroll? This will end your Wayland session.' -B 'Yes, exit scroll' 'scrollmsg exit'

        # Layout mode
        bindsym $mod+alt+h set_mode h
        bindsym $mod+alt+v set_mode v
    #
    # Moving around:
    #
        # Move your focus around
        bindsym $mod+$left focus left
        bindsym $mod+$down focus down
        bindsym $mod+$up focus up
        bindsym $mod+$right focus right
        bindsym $mod+home focus beginning
        bindsym $mod+end focus end
        # Move the focused window with the same, but add Ctrl
        bindsym $mod+Shift+$left move left
        bindsym $mod+Shift+$down move down
        bindsym $mod+Shift+$up move up
        bindsym $mod+Shift+$right move right
        bindsym $mod+Shift+home move beginning
        bindsym $mod+Shift+end move end
        # # nomode
        # bindsym $mod+Alt+$left move left nomode
        # bindsym $mod+Alt+$down move down nomode
        # bindsym $mod+Alt+$up move up nomode
        # bindsym $mod+Alt+$right move right nomode
        # bindsym $mod+Alt+home move beginning nomode
        # bindsym $mod+Alt+end move end nomode

        # Focus other monitors
        bindsym $mod+Ctrl+$left focus output left
        bindsym $mod+Ctrl+$down focus output down
        bindsym $mod+Ctrl+$up focus output up
        bindsym $mod+Ctrl+$right focus output right
    #
    # Workspaces:
    #
        # Switch to workspace
        bindsym $mod+1 workspace number 1
        bindsym $mod+2 workspace number 2
        bindsym $mod+3 workspace number 3
        bindsym $mod+4 workspace number 4
        bindsym $mod+5 workspace number 5
        bindsym $mod+6 workspace number 6
        bindsym $mod+7 workspace number 7
        bindsym $mod+8 workspace number 8
        bindsym $mod+9 workspace number 9
        bindsym $mod+0 workspace number 10
        # Move focused container to workspace
        bindsym $mod+Shift+1 move container to workspace number 1; workspace number 1
        bindsym $mod+Shift+2 move container to workspace number 2; workspace number 2
        bindsym $mod+Shift+3 move container to workspace number 3; workspace number 3
        bindsym $mod+Shift+4 move container to workspace number 4; workspace number 4
        bindsym $mod+Shift+5 move container to workspace number 5; workspace number 5
        bindsym $mod+Shift+6 move container to workspace number 6; workspace number 6
        bindsym $mod+Shift+7 move container to workspace number 7; workspace number 7
        bindsym $mod+Shift+8 move container to workspace number 8; workspace number 8
        bindsym $mod+Shift+9 move container to workspace number 9; workspace number 9
        bindsym $mod+Shift+0 move container to workspace number 10; workspace number 10 
        # Note: workspaces can have any name you want, not just numbers.
        # We just use 1-10 as the default.

        bindsym $mod+Ctrl+1 move workspace to output left
        bindsym $mod+Ctrl+2 move workspace to output right

    # Scaling
        # Workspace
        bindsym $mod+Shift+comma scale_workspace incr -0.05
        bindsym --whole-window $mod+Shift+button4 scale_workspace incr -0.05
        bindsym $mod+Shift+period scale_workspace incr 0.05
        bindsym --whole-window $mod+Shift+button5 scale_workspace incr 0.05
        bindsym $mod+Shift+Ctrl+period scale_workspace reset

        # Overview
        bindsym --no-repeat $mod+w scale_workspace overview
        bindsym --whole-window button8 scale_workspace overview

        # Jump
        # jump_labels_color #9e1530FF
        # jump_labels_background #15309eFF
        # jump_labels_scale 0.9
        # jump_labels_keys asdf
        bindsym --no-repeat $mod+slash jump

        # Content
        bindsym $mod+comma scale_content incr -0.05
        bindsym --whole-window $mod+button4 scale_content incr -0.05
        bindsym $mod+period scale_content incr 0.05
        bindsym --whole-window $mod+button5 scale_content incr 0.05
        bindsym $mod+Ctrl+period scale_content reset

    #
    # Layout stuff:
    #
        # Make the current focus fullscreen
        bindsym $mod+f fullscreen
        bindsym $mod+Ctrl+f fullscreen global

        # Toggle the current focus between tiling and floating mode
        bindsym $mod+y focus mode_toggle
        # Float a window
        bindsym $mod+Shift+f floating toggle

        # Toggle sticky
        bindsym $mod+a sticky toggle

        # Marks
        # bindsym $mod+m exec scroll-mark-toggle.sh
        # bindsym $mod+Shift+m exec scroll-mark-remove.sh
        # bindsym $mod+apostrophe exec scroll-mark-switch.sh

    #
    # Scratchpad:
    #
        # Scroll has a "scratchpad", which is a bag of holding for windows.
        # You can send windows there and get them back later.

        # Move the currently focused window to the scratchpad
        bindsym $mod+Shift+z move scratchpad

        # Show the next scratchpad window or hide the focused scratchpad window.
        # If there are multiple scratchpad windows, this command cycles through them.
        bindsym $mod+z scratchpad show

    #
    # Mode modifiers
    #
    # mode "modifiers" {
    #     bindsym $right set_mode after; mode default 
    #     bindsym $left set_mode before; mode default 
    #     bindsym home set_mode beginning; mode default 
    #     bindsym end set_mode end; mode default 
    #     bindsym $up set_mode focus; mode default 
    #     bindsym $down set_mode nofocus; mode default 
    #     bindsym h set_mode center_horiz; mode default 
    #     bindsym Shift+h set_mode nocenter_horiz; mode default 
    #     bindsym v set_mode center_vert; mode default 
    #     bindsym Shift+v set_mode nocenter_vert; mode default 
    #     bindsym r set_mode reorder_auto; mode default 
    #     bindsym Shift+r set_mode noreorder_auto; mode default 
    #
    #     # Return to default mode
    #     bindsym Escape mode "default"
    # }
    # bindsym $mod+backslash mode "modifiers"

    #
    # Resizing containers:
    #
    bindsym $mod+minus cycle_size h prev
    bindsym $mod+equal cycle_size h next
    bindsym $mod+Shift+minus cycle_size v prev
    bindsym $mod+Shift+equal cycle_size v next

    mode "setsizeh" {
        bindsym 1 set_size h 0.125
        bindsym 2 set_size h 0.1666666667
        bindsym 3 set_size h 0.25
        bindsym 4 set_size h 0.333333333
        bindsym 5 set_size h 0.375
        bindsym 6 set_size h 0.5
        bindsym 7 set_size h 0.625
        bindsym 8 set_size h 0.6666666667
        bindsym 9 set_size h 0.75
        bindsym 0 set_size h 0.833333333
        bindsym minus set_size h 0.875
        bindsym equal set_size h 1.0

        # Return to default mode
        bindsym Escape mode "default"
    }
    bindsym $mod+b mode "setsizeh"

    mode "setsizev" {
        bindsym 1 set_size v 0.125
        bindsym 2 set_size v 0.1666666667
        bindsym 3 set_size v 0.25
        bindsym 4 set_size v 0.333333333
        bindsym 5 set_size v 0.375
        bindsym 6 set_size v 0.5
        bindsym 7 set_size v 0.625
        bindsym 8 set_size v 0.6666666667
        bindsym 9 set_size v 0.75
        bindsym 0 set_size v 0.833333333
        bindsym minus set_size v 0.875
        bindsym equal set_size v 1.0

        # Return to default mode
        bindsym Escape mode "default"
    }
    bindsym $mod+Shift+b mode "setsizev"

    mode "resize" {
        # left will shrink the containers width
        # right will grow the containers width
        # up will shrink the containers height
        # down will grow the containers height
        bindsym $left resize shrink width 100px
        bindsym $down resize grow height 100px
        bindsym $up resize shrink height 100px
        bindsym $right resize grow width 100px

        # Return to default mode
        bindsym Escape mode "default"
    }
    bindsym $mod+Shift+r mode "resize"

    mode "align" {
        bindsym c align center; mode default
        bindsym m align middle; mode default
        bindsym r align reset; mode default
        bindsym $left align left; mode default
        bindsym $right align right; mode default
        bindsym $up align up; mode default
        bindsym $down align down; mode default
        bindsym Escape mode "default"
    }
    bindsym $mod+c mode "align"

    # mode "fit_size" {
    #     bindsym w fit_size h visible proportional; mode default
    #     bindsym Shift+w fit_size v visible proportional; mode default
    #     bindsym Ctrl+w fit_size h visible equal; mode default
    #     bindsym Ctrl+Shift+w fit_size v visible equal; mode default
    #
    #     bindsym $right fit_size h toend proportional; mode default
    #     bindsym Shift+$right fit_size v toend proportional; mode default
    #     bindsym Ctrl+$right fit_size h toend equal; mode default
    #     bindsym Ctrl+Shift+$right fit_size v toend equal; mode default
    #
    #     bindsym $left fit_size h tobeg proportional; mode default
    #     bindsym Shift+$left fit_size v tobeg proportional; mode default
    #     bindsym Ctrl+$left fit_size h tobeg equal; mode default
    #     bindsym Ctrl+Shift+$left fit_size v tobeg equal; mode default
    #
    #     bindsym $up fit_size h active proportional; mode default
    #     bindsym Shift+$up fit_size v active proportional; mode default
    #     #bindsym Ctrl+$up fit_size h active equal; mode default
    #     #bindsym Ctrl+Shift+$up fit_size v active equal; mode default
    #
    #     bindsym $down fit_size h all proportional; mode default
    #     bindsym Shift+$down fit_size v all proportional; mode default
    #     bindsym Ctrl+$down fit_size h all equal; mode default
    #     bindsym Ctrl+Shift+$down fit_size v all equal; mode default
    # }
    # bindsym $mod+w mode "fit_size"

    #
    # Utilities:
    #
        # Special keys to adjust volume via PulseAudio
        bindsym --locked XF86AudioMute exec pactl set-sink-mute \@DEFAULT_SINK@ toggle
        bindsym --locked XF86AudioLowerVolume exec pactl set-sink-volume \@DEFAULT_SINK@ -5%
        bindsym --locked XF86AudioRaiseVolume exec pactl set-sink-volume \@DEFAULT_SINK@ +5%
        bindsym --locked XF86AudioMicMute exec pactl set-source-mute \@DEFAULT_SOURCE@ toggle
        # Special keys to adjust brightness via brightnessctl
        bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-
        bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+
        # Special key to take a screenshot with grim
        bindsym Print exec grim


    focus_wrapping no

    bindgesture swipe:4:right workspace next
    bindgesture swipe:4:left workspace prev

    bindgesture swipe:4:up scale_workspace overview 
    bindgesture swipe:4:down jump

    bindgesture swipe:3:right focus right
    bindgesture swipe:3:left focus left
    bindgesture swipe:3:up focus up
    bindgesture swipe:3:down focus down

    #
    # Status Bar:
    #
    # Read `man 5 scroll-bar` for more information about this section.
    # bar {
    #     position top
    #
    #     # When the status_command prints a new line to stdout, scrollbar updates.
    #     # The default just shows the current date and time.
    #     status_command while date +'%Y-%m-%d %X'; do sleep 1; done
    #
    #     colors {
    #         statusline #ffffff
    #         background #323232
    #         inactive_workspace #32323200 #32323200 #5c5c5c
    #     }
    # }
    #
    # include @sysconfdir@/scroll/config.d/*
  '';
}
