{ pkgs, ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings.auto_install = true;
    settings.ensure_installed = [
      "diff"
      "bash"
      "fish"
      "python"
      "yaml"
      "lua"
      "json"
      "nix"
      "regex"
      "toml"
      "vim"
      "markdown"
      "rust"
      "jsonc"
      "glsl"
      "css"
      "hyprlang"
      "r"
    ];
    settings.highlight.enable = true;
    settings.indent.enable = true;
  };
  programs.nixvim.plugins.hmts.enable = true;
  programs.nixvim.plugins.rainbow-delimiters.enable = true;
}
