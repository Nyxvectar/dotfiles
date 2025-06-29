![Preview](https://github.com/Nyxvectar/media/blob/main/dotfiles/dotfiles_preview.jpg)

## Dotfiles
This repository stores my desktop configuration on `hyprland`. The main branch will keep updated with the configuration on my computer.

### Before Using
- These dotfiles are built exclusively for **NixOS**. Package management and system configuration differ significantly from other distributions. For non-NixOS systems:
   - Use only the raw config files in `./dots/`
   - Manual installation required
- The keymap in `./dots/hypr/hyprland.conf` is designed for `colemak-dh` keybroad layout, to fit usual `qwerty` layout, you need to make some changes to it. But remember not to edit `nix.configuration` that `kb_layout = us`, my layout was customed in hardware, not software config.

### Basic Software Requirements
```nix
{
    programs = {
        fish.enable = true;
        waybar.enable = true;
        hyprland.enable = true;
    };
}
```
```nix
{
    environment.systemPackages = with pkgs; [
        alacritty
        eza
        mako
        pavucontrol
        pipewire
        rofi-wayland
    ];
}
```

### Font Requirements
```nix
fonts = {
    packages = with pkgs; [
        jetbrains-mono
        ubuntu-sans
        ubuntu-sans-mono
        ubuntu_font_family
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        nerd-fonts.ubuntu-mono
    ];
}
```

### Environment Build
#### Software Build
| About | Name |
| --------: | - |
| Distro | NixOS |
| Kernel | Linux 6.15.2 |
| Mirror | Tsinghua University |
| PkgMng | nix (Nix) 2.28.3 |
#### Hardware Build
| Component | Name |
| --------: | - |
| CPU | AMD Ryzen 9 9950X |
| Memory | Gloway DDR5 6800 MT/s 24GiB*2 |
| Graphics | AMD Radeon RX 6500XT |
| Monitor | 2560x1080 @ 75Hz <br/> 2560x1080 @ 200Hz |