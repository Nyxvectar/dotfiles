{ pkgs, config, ... }:
let
  zju-connect = pkgs.callPackage ../../../pkgs/zju-connect.nix { };
  zjuconnect = pkgs.writeShellScriptBin "zjuconnect" ''exec ${zju-connect}/bin/zju-connect --username 3220101015 --password $(cat ${config.age.secrets.zjuconnect_password.path})'';
in
{
  home.packages = [
    zju-connect
    zjuconnect
  ];
}
