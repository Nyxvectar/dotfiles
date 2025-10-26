{
  programs.nixvim = {
    plugins.cmp = {
      enable = true;
      settings.sources = [
        { name = "buffer"; }
        { name = "path"; }
        { name = "spell"; }
        { name = "emoji"; }
        { name = "luasnip"; }
        { name = "nvim_lsp"; }
      ];
      settings.mapping = {
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
      settings.window.completion.border = [
        "╭"
        "─"
        "╮"
        "│"
        "╯"
        "─"
        "╰"
        "│"
      ];
    };
    plugins.cmp-buffer.enable = true;
    plugins.cmp-path.enable = true;
    plugins.cmp-spell.enable = true;
    plugins.cmp-emoji.enable = true;
    plugins.cmp-nvim-lsp.enable = true;
  };
}
