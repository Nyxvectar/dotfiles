{
  pkgs,
  lib,
  inputs,
  host,
  user,
  ...
}:
{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        inlayHints = true;
        keymaps = {
          diagnostic = {
            "<leader>lE" = "open_float";
            "[" = "goto_prev";
            "]" = "goto_next";
          };
          lspBuf = {
            "gD" = "declaration";
            "gd" = "definition";
            "gr" = "references";
            "gI" = "implementation";
            "gy" = "type_definition";
          };
        };
        servers = {
          ruff.enable = true;
          pyright.enable = true;
          lua_ls.enable = true;
          nixd = {
            enable = true;
            package = inputs.nixd.packages.${pkgs.system}.nixd;
            settings = {
              formatting.command = [ "nixfmt" ];
              nixd.nixpkgs.expr = "import <nixpkgs> { }";
              options =
                let
                  flake = # nix
                    ''(builtins.getFlake "/home/${user}/.config/nixos")'';
                in
                {
                  nixos.expr = # nix
                    ''${flake}.nixosConfigurations.${host}.options'';
                  home_manager.expr = # nix
                    ''${flake}.homeConfigurations."${user}@${host}".options'';
                };
            };
          };
          nil_ls = {
            enable = true;
            package = inputs.nil.packages.${pkgs.system}.nil;
            settings = {
              # formatting.command = ["nixfmt"];
              nix.flake = {
                autoArchive = true;
              };
            };
          };
          texlab.enable = true;
          qmlls = {
            enable = true;
            filetypes = [ "qml" ];
          };
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = "fallback";
            timeout_ms = 500;
          };
          notify_on_error = true;

          formatters_by_ft = {
            bash = [
              "shfmt"
              "shellcheck"
              "shellharden"
            ];
            css = [ "prettier" ];
            scss = [ "prettier" ];
            html = [ "prettier" ];
            json = [ "prettier" ];
            jsonc = [ "prettier" ];
            lua = [ "stylua" ];
            markdown = [
              "prettier"
              "injected"
            ];
            nix = [
              "nixfmt"
              "injected"
            ];
            yaml = [ "yamlfmt" ];
            python = [ "ruff" ];
            tex = [ "latexindent" ];
          };
          formatters = {
            injeced.lang_to_ext = {
              lua = "lua";
            };
            shfmt.command = lib.getExe pkgs.shfmt;
            shellcheck.command = lib.getExe pkgs.shellcheck;
            shellharden.command = lib.getExe pkgs.shellharden;
            stylua.command = lib.getExe pkgs.stylua;
            yamlfmt.command = lib.getExe pkgs.yamlfmt;
            latexindent.prepend_args = [ ''-y="defaultIndent='  '"'' ];
          };
        };
      };
      lsp-format = {
        enable = true;
      };
      lspsaga = {
        enable = true;
        settings.lightbulb = {
          virtualText = true;
          sign = false;
        };
      };
      trouble.enable = true;
      lsp-signature.enable = true;
      otter.enable = true;
    };
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "K";
      action = ":Lspsaga hover_doc<CR>";
    }
    {
      mode = "n";
      key = "<Leader>lo";
      action = ":Lspsaga outline<CR>";
    }
    {
      mode = "n";
      key = "<Leader>lr";
      action = ":Lspsaga rename<CR>";
    }
    {
      mode = "n";
      key = "<Leader>la";
      action = ":Lspsaga code_action<CR>";
    }
    {
      mode = "n";
      key = "<Leader>lf";
      action = ":Lspsaga finder<CR>";
    }
  ];
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    nvim-docs-view
  ];
}
