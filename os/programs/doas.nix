{ user, ... }:
{
  security = {
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ user ];
          noPass = true;
          keepEnv = true;
        }
      ];
    };
    sudo.enable = true;
  };
}
