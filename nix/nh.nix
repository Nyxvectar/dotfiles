{
  self,
  host,
  user,
  pkgs,
  inputs,
  ...
}:
{
  programs.nh = {
    enable = true;
    package = inputs.nh.packages.${pkgs.system}.nh;
    clean = {
      enable = true;
      dates = "3 days";
      extraArgs =
        let
          numColorschemes = builtins.length self.homeConfigurations."${user}@${host}".config.colorSchemes;
          numToKeep = numColorschemes * 2 |> toString;
        in
        "--keep ${numToKeep}";
    };
  };
  environment.variables.NH_FLAKE = "/home/${user}/.config/nixos";
}
