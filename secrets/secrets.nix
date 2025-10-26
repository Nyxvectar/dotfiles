let
  eden = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGXeMZ+CkyITSuDSbt4T9uglVJvt+c75X4QPiX8iCFbx";
  publicKeys = [ eden ] ++ (map (host: host.publicKey) (import ../hosts/hosts.nix));
  secrets = [
    "siliconflow_token"
    "gemini_token"
    "deepseek_token"
    "zjuchat_token"
    "tavily_token"
    "zjuconnect_password"
    "linkai_token"
    "anyrouter_token"
  ];
in
builtins.listToAttrs (
  map (secret: {
    name = "${secret}.age";
    value = { inherit publicKeys; };
  }) secrets
)
