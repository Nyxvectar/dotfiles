![Preview](https://github.com/Nyxvectar/media/blob/main/dotfiles/dotfilesPreview.jpg)
## NixOS Dotfiles for Colemak-DH & Apple Layout
### Before Using
- These dotfiles are designed exclusively for linux that using **Nix**, and under **Colemak-DH** keyboard layout. Package management and system configuration differ significantly from other distributions. For non-Nix systems:
  - Use only the raw configuration files in `./home/`
  - Manual installation is required
- The keymap in `./home/hypr/hyprland.conf` is optimized for `Colemak-DH` keyboard layout. To adapt for standard `QWERTY` layouts:
  - Modify the keybindings as needed
  - Note that `nix.configuration` retains `kb_layout = us`, as my layout customization occurs at the hardware level, not in software configuration

### Usage
#### Installation
```
git clone --depth 1 --single-branch https://github.com/Nyxvectar/dotfiles.git ~/Downloads/dotfiles-nyxvectar/
bash ~/Downloads/dotfiles-nyxvectar/apply.sh
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
- For others, please review the source codes.

### System Environment
#### Software Specifications
| Category | Component          |
| --------: |--------------------|
| Distro | NixOS 25.05        |
| Kernel | Linux 6.15.2       |
| Mirror | Tsinghua University|
| PkgMng | nix (Nix) 2.28.3   |

#### Hardware Configuration
| Component | Details                                     |
| --------: |---------------------------------------------|
| CPU | AMD Ryzen 9 9950X                           |
| Graphics | AMD Radeon RX 6500XT                        |
| Monitor | 2560x1080 75Hz@DP <br/> 2560x1080 120Hz@HDMI|