{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./lsp.nix
    ./cmp.nix
    ./ai.nix
    ./lualine.nix
    ./treesitter.nix
    ./hop.nix
    ./ui.nix
    ./mini.nix
  ];
  stylix.targets.nixvim.enable = true;
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    performance.combinePlugins = {
      enable = true;
      standalonePlugins = [
        "copilot.lua"
        "nvim-treesitter"
      ];
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };
    highlightOverride = with config.lib.stylix.colors.withHashtag; {
      CursorLineNr = {
        bg = base01;
        fg = base06;
      };
      Comment.italic = true;
      Comment.fg = base03;
      Boolean.italic = true;
      Boolean.fg = base0E;
      String.italic = true;
      String.fg = base0B;
      StatusLine.bg = base00;
    };
    opts = {
      number = true;
      relativenumber = true;
      mouse = "a";
      showmode = false;
      clipboard.providers.wl-copy.enable = true;
      breakindent = true;
      tabstop = 2;
      shiftwidth = 2;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      updatetime = 250;
      timeoutlen = 300;
      splitright = true;
      splitbelow = true;
      list = true;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
      inccommand = "split";
      cursorline = true;
      hlsearch = true;
      scrolloff = 10;
      spell = true;
      spelllang = [
        "en_us"
        "cjk"
      ];
      spellsuggest = "best,4";
    };
    keymaps = [
      {
        mode = "n";
        key = "S";
        action = ":w<cr>";
      }
      {
        mode = "n";
        key = "Q";
        action = ":bd<cr>";
      }
      {
        mode = "n";
        key = "<Leader>1";
        action = ":BufferLineGoToBuffer 1<cr>";
      }
      {
        mode = "n";
        key = "<Leader>2";
        action = ":BufferLineGoToBuffer 2<cr>";
      }
      {
        mode = "n";
        key = "<Leader>2";
        action = ":BufferLineGoToBuffer 2<cr>";
      }
      {
        mode = "n";
        key = "<Leader>3";
        action = ":BufferLineGoToBuffer 3<cr>";
      }
      {
        mode = "n";
        key = "<Leader>4";
        action = ":BufferLineGoToBuffer 4<cr>";
      }
      {
        mode = "t";
        key = "<Esc><Esc>";
        action = "<C-\\><C-n>";
      }
      {
        mode = "n";
        key = "<Leader>o";
        action = ":lua MiniFiles.open()<cr>";
      }
    ];
    plugins = {
      sleuth.enable = true; # automatically set shiftwidth and expandtab based on the file
      nvim-surround.enable = true;
      repeat.enable = true;
      lastplace.enable = true;
      nvim-autopairs.enable = true;
      endwise.enable = true;
      markdown-preview.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      fcitx-vim
    ];
  };
}
