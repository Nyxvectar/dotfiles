{ pkgs, config, ... }:
{
  programs.gemini-cli = {
    enable = true;
  };
  programs.claude-code = {
    enable = true;
  };
  home.sessionVariables = {
    GEMINI_API_KEY = "$(cat ${config.age.secrets.gemini_token.path})";
    ANTHROPIC_AUTH_TOKEN = "$(cat ${config.age.secrets.anyrouter_token.path})";
    ANTHROPIC_BASE_URL = "https://anyrouter.top";
    SILICONFLOW_API_KEY = "$(cat ${config.age.secrets.siliconflow_token.path})";
  };
  home.packages = with pkgs; [ nur.repos.charmbracelet.crush ];
  xdg.configFile."crush/crush.json".text = ''
    {
      "providers": {
        "siliconflow": {
          "id": "siliconflow",
          "name": "siliconflow",
          "base_url": "https://api.siliconflow.cn/v1",
          "api_key": "$SILICONFLOW_API_KEY",
          "type": "openai",
          "models": [
            {
              "id": "Pro/deepseek-ai/DeepSeek-V3.2-Exp",
              "name": "DeepSeek-V3.2",
              "cost_per_1m_in": 2,
              "cost_per_1m_out": 3,
              "context_window": 160000,
              "default_max_token": 5000
            }
          ]
        }
      }
    }
  '';
}
