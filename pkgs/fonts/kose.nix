{
  lib,
  stdenvNoCC,
  pkgs,
}:
let
  mono = pkgs.fetchurl {
    name = "XiaolaiMonoSC-Regular.ttf";
    url = "https://github.com/lxgw/kose-font/releases/download/v3.120/XiaolaiMonoSC-Regular.ttf";
    sha256 = "1wxjjvd6dr9va6i65rl5nsjmxmzpm7xz4pnr0afs9n4v6vgvpq51";
  };
  regular = pkgs.fetchurl {
    name = "XiaolaiSC-Regular";
    url = "https://github.com/lxgw/kose-font/releases/download/v3.120/XiaolaiSC-Regular.ttf";
    sha256 = "0zr043nj3prw5v4znarhzi1jigr7f6lxnajsrj10gzqaxf4wdq35";
  };
in
stdenvNoCC.mkDerivation {
  pname = "kose-font";
  version = "2025-02-22";

  srcs = [
    mono
    regular
  ];

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts
    cp ${mono} $out/share/fonts
    cp ${regular} $out/share/fonts

    mkdir -p $out/etc/fonts/conf.d

    runHook postInstall
  '';

  meta = with lib; {
    description = "The Kose font by LXGW";
    homepage = "https://github.com/lxgw/kose-font";
    platforms = platforms.all;
  };
}
