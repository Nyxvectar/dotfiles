![Preview](https://github.com/Nyxvectar/media/blob/main/dotfiles/dotfilesPreview.jpg)
## Nix Dotfiles for Colemak-DH & Apple Layout
### Before Using
- These dotfiles are designed exclusively for linux that using **Nix**, and under **Colemak-DH** keyboard layout. Package management and system configuration differ significantly from other distributions. For non-Nix systems:
  - Use only the raw configuration files in `./home/`
  - Manual installation is required
- The keymap in `./home/hypr/hyprland.conf` is optimized for `Colemak-DH` keyboard layout. To adapt for standard `QWERTY` layouts:
  - Modify the keybindings as needed
  - Note that `nix.configuration` retains `kb_layout = us`, as my layout customization occurs at the hardware level, not in software configuration

> [!NOTE]
> This setup uses Dae and Daed proxy. If you don't need the eBPF core feature or related options, you can safely ignore them. They're imported in `./flake.nix`

> [!WARNING]
> `substituters = lib.mkForce [];` had been set in `./imports/env.nix` due to I am keen on compiling.

### Usage
#### Installation
```bash
git clone --depth 1 --single-branch https://github.com/Nyxvectar/dotfiles.git ~/Downloads/nyxvectar/dotfiles/
bash ~/Downloads/nyxvectar/dotfiles/apply.sh
```
#### Essential Hotkeys
![Hotkeys](https://github.com/Nyxvectar/media/blob/main/dotfiles/superUsage.jpg)
- Press `Super + [NUM]` to switch workspaces directly
- While holding `Super + Shift`:
  - `S`: Capture screenshot (grim, slurp, wl-copy)
  - `D/T/R/A`: Launch Discord/Telegram/Element/WeChat
  - `[NUM]`: Move window to specified workspace
  - `N/I`: Move window to previous/next workspace
  - `H/W/M`: Exit Hyprland/Restart Waybar/Reload Mako
- `Super + Mouse_Left`: Drag windows
- `Super + Mouse_Right`: Resize windows
  - Alternatively, use `Super + Arrow keys` for window resizing

> [!NOTE]
> For others, please review the source codes.

### Build Environment
| Category  | Component                                    |
|-----------|----------------------------------------------|
| Distro    | NixOS 25.05                                  |
| Kernel    | Linux 6.15.6                                 |
| PkgMng    | nix (Nix) 2.28.4                             |
| CPU       | AMD Ryzen 9 9950X                            |
| Graphics  | AMD Radeon RX 6500XT                         |
| Monitor   | 2560x1080 75Hz@DP <br/> 2560x1080 120Hz@HDMI |

I extend my gratitude to JetBrains for their support of open source.

[![JetBrains](https://resources.jetbrains.com/storage/products/company/brand/logos/jb_beam.svg)](https://jb.gg/OpenSourceSupport)
