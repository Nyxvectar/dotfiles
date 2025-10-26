{ stdenvNoCC, ... }:
stdenvNoCC.mkDerivation {
  name = "custom-colorschemes";
  src = ./colorSchemes;
  installPhase = ''
    mkdir -p $out/share/themes
    cp *.yaml $out/share/themes
  '';
  meta = {
    description = "Custom base16 color schemes that are not included in the base16 repository";
  };
}
