{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.swhkd
  ];
}
