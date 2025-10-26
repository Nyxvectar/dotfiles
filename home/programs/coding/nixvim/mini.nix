{
  programs.nixvim.plugins = {
    mini.enable = true;
    mini.modules = {
      align = { };
      files = {
        mappings = {
          close = "<Esc>";
        };
      };
      hipatterns = {
        hex_color = "hipatterns.gen_highlighter.hex_color()";
      };
      indentscope = { };
      move = {
        mappings = {
          left = "<C-h>";
          right = "<C-l>";
          up = "<C-k>";
          down = "<C-j>";
          line_left = "<C-h>";
          line_right = "<C-l>";
          line_up = "<C-k>";
          line_down = "<C-j>";
        };
      };
    };
  };
}
