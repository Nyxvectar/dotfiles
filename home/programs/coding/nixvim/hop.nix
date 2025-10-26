{
  programs.nixvim.plugins.hop.enable = true;
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<Leader>hw";
      action = ":HopWord<CR>";
    }
    {
      mode = "n";
      key = "<Leader>hl";
      action = ":HopLine<CR>";
    }
  ];
}
