{ pkgs, ... }:
{
  lib.misc.addFlags =
    flags: name: pkg:
    pkgs.symlinkJoin {
      name = "${name}-wrapped";
      paths = [ "${pkg}" ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/${name} --add-flags "${flags}"
      '';
    };
}
