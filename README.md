![Preview](https://github.com/Nyxvectar/media/blob/main/dotfiles/dotfiles_preview.jpg)

## Dotfiles
This repository stores my desktop configuration on `hyprland`. The main branch will keep updated with the configuration on my computer.

### Before Using
- These dotfiles are built exclusively for **NixOS**. Package management and system configuration differ significantly from other distributions. For non-NixOS systems:
   - Use only the raw config files in `./dots/`
   - Manual installation required
- The keymap in `./dots/hypr/hyprland.conf` is designed for `colemak-dh` keybroad layout, to fit usual `qwerty` layout, you need to make some changes to it. But remember not to edit `nix.configuration` that `kb_layout = us`, my layout was customed in hardware, not software config.

### Usage
## Installation
```bash
git clone https://github.com/Nyxvectar/dotfiles.git ~/.cache/
bash ~/.cache/dotfiles/apply.sh
```
## Hotkeys(on Colemak-DH)
| Key Combination             | Description                                                                 |
|-----------------------------|-----------------------------------------------------------------------------|
| `Super + A`                 | Launch Alacritty terminal                                                   |
| `Super + D`                 | Close active window                                                         |
| `Super + W`                 | Launch Nautilus file manager                                                |
| `Super + V`                 | Toggle floating/tiled mode for current window                               |
| `Super + Q`                 | Launch Rofi application launcher (`drun` mode)                              |
| `Super + J`                 | Launch Kitty terminal                                                       |
| `Super + F`                 | Toggle fullscreen mode for current window                                   |
| `Super + S`                 | Launch Firefox browser                                                      |
| `Super + M`                 | Lock screen (hyprlock)                                                      |
| `Super + Shift + H`         | Exit Hyprland                                                               |
| `Super + Shift + W`         | Restart Waybar                                                              |
| `Super + Shift + M`         | Restart notification daemon (mako)                                          |
| `Super + Shift + D`         | Launch Discord                                                              |
| `Super + Shift + T`         | Launch Telegram                                                             |
| `Super + Shift + N`         | Launch Element (Matrix client)                                              |
| `Super + Shift + Q`         | Launch QQ                                                                   |
| `Super + Shift + A`         | Execute WeChat fix script (`~/.config/hypr/scripts/wechat-fix.sh`)          |
| `Super + Shift + S`         | Capture region screenshot (Grim + Slurp) and copy to clipboard              |
| `Super + N`                 | Switch to left workspace (equivalent to `Super + MouseUp`)                  |
| `Super + I`                 | Switch to right workspace (equivalent to `Super + MouseDown`)               |
| `Super + L`                 | Move focus left                                                             |
| `Super + Y`                 | Move focus right                                                            |
| `Super + U`                 | Move focus up                                                               |
| `Super + E`                 | Move focus down                                                             |
| `Alt + Left Arrow`          | Resize active window 40px narrower (left)                                   |
| `Alt + Right Arrow`         | Resize active window 40px wider (right)                                     |
| `Alt + Up Arrow`            | Resize active window 40px shorter (up)                                      |
| `Alt + Down Arrow`          | Resize active window 40px taller (down)                                     |
| `Super + Tab`               | Switch to previous workspace                                                |
| `Super + [1-0]`             | Switch to workspace 1-10                                                    |
| `Super + Shift + [1-0]`     | Move active window to workspace 1-10                                        |
| `Super + Shift + MouseDown` | Move active window to next workspace                                        |
| `Super + Shift + MouseUp`   | Move active window to previous workspace                                    |
| `Super + Shift + Left`      | Move active window to left workspace                                        |
| `Super + Shift + Right`     | Move active window to right workspace                                       |
| `Super + MouseDown`         | Switch to next workspace                                                    |
| `Super + MouseUp`           | Switch to previous workspace                                                |
| `Super + Mouse:272 (Left)`  | Drag to move window (hold `Super` + Left mouse button)                      |
| `Super + Mouse:273 (Right)` | Drag to resize window (hold `Super` + Right mouse button)                   |
| `XF86AudioLowerVolume`      | Decrease volume by 5%                                                       |
| `XF86AudioRaiseVolume`      | Increase volume by 5%                                                       |
| `XF86AudioMute`             | Toggle mute for default audio device                                        |

### Key Notes:
1. **Main Modifier**: `$mainMod = Super` (Windows/Command key)
2. **Directional Keys**:
  - `N` = Left
  - `I` = Right
  - `U` = Up
  - `E` = Down
3. **Workspace Navigation**: Supports numeric keys (1-10), mouse wheel, and arrow keys
4. **Hardware Keys**: Volume controls use direct hardware keys (no modifiers)

### Environment Build
#### Software Build
| About | Name                |
| --------: |---------------------|
| Distro | NixOS 25.05         |
| Kernel | Linux 6.15.2        |
| Mirror | Tsinghua University |
| PkgMng | nix (Nix) 2.28.3    |

#### Hardware Build
| Component | Name                                         |
| --------: |----------------------------------------------|
| CPU | AMD Ryzen 9 9950X                            |
| Memory | Gloway DDR5 6800 MT/s 48GiB                  |
| Graphics | AMD Radeon RX 6500XT                         |
| Monitor | 2560x1080 75Hz@DP <br/> 2560x1080 200Hz@HDMI |