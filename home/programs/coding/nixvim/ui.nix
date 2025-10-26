{ pkgs, ... }:
{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    telescope.enable = true;
    bufferline.enable = true;
    scrollview.enable = true;
    cursorline.enable = true;
    cursorline.settings.cursorword.enable = true;
    fidget.enable = true;
    indent-blankline.enable = true;
    gitsigns.enable = true;
    navbuddy.enable = true;
    smartcolumn.enable = true;
    fastaction.enable = true;
    colorizer = {
      enable = true;
      settings.user_default_options = {
        mode = "virtualtext";
        css = true;
        css_fn = true;
        names = false;
        virtualtext = "■";
        virtualtext_inline = true;
        virtualtext_mode = "foreground";
      };
    };
    which-key = {
      enable = true;
      settings.spec = [
        {
          __unkeyed = "<Leader>f";
          name = "Telescope";
        }
        {
          __unkeyed = "<Leader>l";
          name = "LSP";
        }
        {
          __unkeyed = "<Leader>m";
          name = "Minimap";
        }
        {
          __unkeyed = "<Leader>c";
          name = "CodeCompanion";
        }
        {
          __unkeyed = "<Leader>h";
          name = "Hop";
        }
      ];
    };
    render-markdown = {
      enable = true;
      settings.file_types = [
        "markdown"
        "codecompanion"
      ];
    };
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<Leader>ff";
      action = ":Telescope fd<CR>";
    }
    {
      mode = "n";
      key = "<Leader>fd";
      action = ":Telescope diagnostics<CR>";
    }
    {
      mode = "n";
      key = "<Leader>fb";
      action = ":Telescope buffers<CR>";
    }
    {
      mode = "n";
      key = "<Leader>fr";
      action = ":Telescope registers<CR>";
    }
  ];
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    codewindow-nvim
  ];
  programs.nixvim.extraConfigLua =
    # lua
    ''
      local codewindow = require("codewindow")
      codewindow.setup()
      codewindow.apply_default_keybinds()
    '';
}
