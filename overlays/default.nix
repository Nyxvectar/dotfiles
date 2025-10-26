{ inputs, ... }:
{
  additions =
    final: prev:
    import ../pkgs {
      pkgs = final;
    };

  modifications = final: prev: {
    qutebrowser = prev.qutebrowser.override { enableWideVine = true; };
    base16-schemes = prev.base16-schemes.overrideAttrs (oldAttrs: {
      installPhase = ''
        runHook preInstall

        mkdir -p $out/share/themes/
        install base16/*.yaml $out/share/themes/
        install ${final.custom-colorschemes}/share/themes/*.yaml $out/share/themes/

        runHook postInstall
      '';
    });
    sway-unwrapped =
      (prev.sway-unwrapped.overrideAttrs (oldAttrs: {
        src = inputs.scroll;
        patches = [ ];
      })).override
        { inherit (inputs.nixpkgs-wayland.packages.${final.system}) wlroots; };
    sway = prev.sway.overrideAttrs (oldAttrs: {
      passthru.providedSessions = [ "scroll" ];
    });
    inherit (inputs.nixpkgs-wayland.packages.${final.system}) swww;
  };

  inherit (inputs.niri.overlays) niri;
  nur = inputs.nur.overlays.default;
  nix-matlab = inputs.nix-matlab.overlay;
}
