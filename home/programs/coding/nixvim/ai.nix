{
  config,
  pkgs,
  ...
}:
let
  get_base_secret =
    path:
    builtins.split "/" path
    |> builtins.tail
    |> builtins.filter (value: builtins.isString value)
    |> builtins.concatStringsSep "/";
in
{
  programs.nixvim = {
    # extraPlugins = [
    #   (pkgs.vimUtils.buildVimPlugin {
    #     name = "fittencode";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "luozhiya";
    #       repo = "fittencode.nvim";
    #       rev = "a52440968404917d0a3625a60c809edf65e52787";
    #       hash = "sha256-Xw34CLaVIXDbX6knW9TZgE0eaz6bT4UGKiBHesH/KcQ=";
    #     };
    #   })
    # ];
    # extraConfigLua =
    #   # lua
    #   ''
    #     require("fittencode").setup({
    #     	completion_mode = "inline",
    #     	keymaps = {
    #     		inline = {
    #     			["<C-L>"] = "accept_all_suggestions",
    #     		},
    #     	},
    #     })
    #   '';
    extraConfigLua =
      # lua
      ''
        local cmp = require("cmp")
        local current_sources = cmp.get_config().sources or {}
        table.insert(current_sources, {
        	name = "copilot",
        	priority = 100,
        })
        cmp.setup({
        	sources = current_sources,
        })
      '';
    plugins = {
      copilot-lua = {
        enable = true;
        settings = {
          panel.enabled = false;
          suggestion.enabled = false;
          filetypes.markdown = true;
        };
      };
      copilot-cmp.enable = true;
      # cmp.settings.sources = [
      #   {
      #     # name = "fittencode";
      #     name = "copilot";
      #     group_index = 2;
      #   }
      # ];
      codecompanion = {
        enable = true;
        settings = {
          adapters.http.deepseek.__raw =
            # lua
            ''
              function()
                local deepseek_token_file = io.open(os.getenv("XDG_RUNTIME_DIR") .. "/" .. "${get_base_secret config.age.secrets.deepseek_token.path}", "r")
                local deepseek_api_key = deepseek_token_file:read()
                deepseek_token_file:close()
                return require("codecompanion.adapters").extend("deepseek", {
                  env = {
                    url = "https://api.deepseek.ai",
                    api_key = deepseek_api_key,
                  }
                })
              end
            '';
          adapters.http.siliconflow.__raw =
            # lua
            ''
              function ()
                local siliconflow_token_file = io.open(os.getenv("XDG_RUNTIME_DIR") .. "/" .. "${get_base_secret config.age.secrets.siliconflow_token.path}", "r")
                local siliconflow_api_key = siliconflow_token_file:read()
                siliconflow_token_file:close()
                return require("codecompanion.adapters").extend("openai_compatible", {
                  name = "siliconflow",
                  env = {
                    url = "https://api.siliconflow.cn",
                    api_key = siliconflow_api_key,
                  },
                  schema = {
                    model = {
                      default = "Pro/deepseek-ai/DeepSeek-V3",
                    }
                  }
                })
              end
            '';
          adapters.http.gemini.__raw =
            # lua
            ''
              function()
                local gemini_token_file = io.open(os.getenv("XDG_RUNTIME_DIR") .. "/" .. "${get_base_secret config.age.secrets.gemini_token.path}", "r")
                local gemini_api_key = gemini_token_file:read()
                gemini_token_file:close()
                return require("codecompanion.adapters").extend("gemini", {
                  env = {
                    api_key = gemini_api_key,
                  },
                  schema = {
                    model = {
                      default = "gemini-2.0-flash-thinking-exp-01-21",
                    }
                  }
                })
              end
            '';
          strategies = {
            inline = {
              adapter = "siliconflow";
              keymaps = {
                accept_change.modes.n = "<Leader>ca";
                reject_change.modes.n = "<Leader>cr";
              };
            };
            chat = {
              adapter = "siliconflow";
              slash_commands.__raw = # lua
                ''
                  {
                    ["file"] = {
                      opts = {
                        provider = "telescope",
                      },
                    },
                  },
                  {
                    ["buffer"] = {
                      opts = {
                        provider = "telescope",
                      },
                    },
                  },
                '';
            };
            agent.adapter = "siliconflow";
          };
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<Leader>ca";
        action = ":CodeCompanionActions<cr>";
      }
      {
        mode = "n";
        key = "<Leader>cc";
        action = ":CodeCompanionChat Toggle<cr>";
      }
      {
        mode = "n";
        key = "<Leader>ci";
        action = ":CodeCompanion ";
      }
    ];
  };
}
