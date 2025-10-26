{
  pkgs,
  lib,
  user,
  config,
  ...
}:
let
  niri-autostart = pkgs.writeShellApplication {
    name = "niri-autostart";
    runtimeInputs = with pkgs; [
      swww
      clash-meta
      wlsunset
      systemd
      killall
      waycorner
      config.programs.caelestia.cli.package
    ];
    extraShellCheckFlags = [ ];
    bashOptions = [ ];
    text =
      # bash
      ''
        killall swhkd
        killall swhks
        swhks &
        doas swhkd -c ~/.config/niri/swhkd/niri.swhkdrc &
        swww kill
        swww-daemon --namespace "background" &
        swww-daemon --namespace "backdrop" &
        # swww restore --namespace "background"
        # swww restore --namespace "backdrop"
        clash-meta -d ~/.config/clash &
        wlsunset -s 00:00 -S 00:00 -t 5000 -T 5001 &
      ''
      + (
        builtins.attrNames config.monitors
        |> map (monitor: [
          "swww img --namespace background -o ${monitor} \"/home/${user}/Pictures/Wallpapers/generated/$(cat ~/.cache/swww/${monitor}-file)\""
          "sleep 0.2"
          "swww img --namespace backdrop -o ${monitor} \"/home/${user}/Pictures/Wallpapers/generated/$(cat ~/.cache/swww/${monitor}-blurred-file)\""
          "sleep 0.2"
        ])
        |> builtins.concatLists
        |> builtins.concatStringsSep "\n"
      )
      + "\n"
      + (
        if config.desktopShell == "caelestia" then
          # bash
          ''
            caelestia wallpaper -f "/home/${user}/Pictures/Wallpapers/generated/$(cat ~/.cache/swww/${config.lib.monitors.mainMonitorName}-file)"
            caelestia scheme set -n dynamic -m dark
          ''
        else
          ''''
      );
  };
  niri-blur-wallpaper = pkgs.writers.writePython3Bin "niri-blur-wallpaper" { doCheck = false; } ''
    import os
    import subprocess
    import json

    wallpapers_path = "/home/${user}/Pictures/Wallpapers/generated/"
    events_of_interest = [
        "Workspace changed",
        "Workspace focused",
        "Window opened",
        "Window closed",
    ]


    def get_niri_msg_output(msg):
        output = subprocess.check_output(["niri", "msg", "-j", msg])
        output = json.loads(output)
        return output


    def get_current_wallpaper(monitor):
        output = (
            subprocess.check_output(["swww", "query", "--namespace", "background"])
            .decode()
            .strip()
            .split("\n")
        )
        output = [info.split(", ") for info in output]
        for o in output:
            if o[0].split(": ")[1] == monitor:
                return o[2].split(": ")[2]
        return None


    def set_wallpaper(monitor, wallpaper):
        subprocess.Popen(
            [
                "swww",
                "img",
                "--transition-type",
                "fade",
                "--transition-duration",
                "0.3",
                "--namespace",
                "background",
                "-o",
                monitor,
                wallpaper,
            ]
        )


    def set_backdrop_wallpaper(monitor, wallpaper):
        subprocess.Popen(
            [
                "swww",
                "img",
                "--transition-type",
                "fade",
                "--transition-duration",
                "0.3",
                "--namespace",
                "backdrop",
                "-o",
                monitor,
                wallpaper,
            ]
        )


    def get_wallpaper_name(wallpaper_path):
        current_wallpaper_is_blurred = "blurred" in wallpaper_path
        if current_wallpaper_is_blurred:
            wallpaper_name = "-".join(wallpaper_path.split("-")[1:-1])
        else:
            wallpaper_name = "-".join(wallpaper_path.split("-")[1:])
            wallpaper_name = ".".join(wallpaper_name.split(".")[:-1])
        return wallpaper_name


    def set_wallpaper_if_needed(active_workspace, init):
        active_workspace_monitor = active_workspace["output"]
        current_wallpaper = get_current_wallpaper(active_workspace_monitor)
        current_wallpaper_is_live = current_wallpaper.endswith(".gif")
        if current_wallpaper_is_live:
            return
        wallpaper_name = get_wallpaper_name(current_wallpaper)
        active_workspace_is_empty = active_workspace["active_window_id"] is None
        wallpaper = os.path.join(wallpapers_path, f"{wallpaper_name}.jpg")
        blurred_wallpaper = os.path.join(wallpapers_path, f"{wallpaper_name}-blurred.jpg")
        if not active_workspace_is_empty:
            wallpaper = blurred_wallpaper
        real_wallpaper = os.path.realpath(wallpaper)
        if init:
            set_backdrop_wallpaper(active_workspace_monitor, blurred_wallpaper)
        if current_wallpaper == real_wallpaper and not init:
            return
        set_wallpaper(active_workspace_monitor, wallpaper)


    def change_wallpaper(init=False):
        workspaces = get_niri_msg_output("workspaces")
        active_workspaces = [
            workspace for workspace in workspaces if workspace["is_active"]
        ]
        for active_workspace in active_workspaces:
            set_wallpaper_if_needed(active_workspace, init)


    def main():
        change_wallpaper(init=True)
        event_stream = subprocess.Popen(
            ["niri", "msg", "event-stream"], stdout=subprocess.PIPE
        )
        if not event_stream.stdout:
            return
        for line in iter(event_stream.stdout.readline, ""):
            if any(event in line.decode() for event in events_of_interest):
                change_wallpaper()


    if __name__ == "__main__":
        main()
  '';
in
{
  systemd.user.services.niri-blur-wallpaper = {
    Unit = {
      Description = "Niri Blur Wallpaper";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${niri-blur-wallpaper}/bin/niri-blur-wallpaper";
      Restart = "on-failure";
    };
  };
  home.activation.restart-niri-blur-wallpaper =
    lib.hm.dag.entryAfter [ "reload-swhkd" ]
      # bash
      ''run --quiet ${pkgs.systemd}/bin/systemctl --user restart niri-blur-wallpaper'';
  programs.niri.settings.spawn-at-startup = [
    { command = [ "${niri-autostart}/bin/niri-autostart" ]; }
    { command = [ "${pkgs.xwayland-satellite}/bin/xwayland-satellite" ]; }
  ];
}
