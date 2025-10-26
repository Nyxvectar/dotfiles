{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "latex"
      "python"
    ];
    userSettings = {
      features = {
        copilot = true;
      };
      vim_mode = true;
      hover_popover_enabled = true;
      confirm_quit = true;
      show_completions_on_input = true;
      show_completion_documentation = true;
      auto_signature_help = true;
      show_inline_completions_in_menu = true;
      show_wrap_guides = true;
      show_inline_completions = true;
      show_whitespaces = "all";
      vertical_scroll_margin = 5;
      relative_line_numbers = true;
      inlay_hints.enabled = true;
      assistant = {
        enabled = true;
        # default_model = {
        #   provider = "deepseek";
        #   model = "deepseek-reasoner";
        # };
      };
      enable_language_server = true;
      format_on_save = "on";
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      auto_update = false;
      auto_install_extensions.html = false;
      languages = {
        Markdown.format_on_save = true;
      };
      # language_models.deepseek = {
      #   api_url = "https://api.deepseek.com";
      #   available_models = [
      #     {
      #       name = "deepseek-reasoner";
      #       display_name = "DeepSeek Reasoner";
      #       max_tokens = 64000;
      #       max_output_tokens = 4096;
      #     }
      #   ];
      # };
    };
  };
  stylix.targets.zed.enable = true;
}
