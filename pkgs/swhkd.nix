{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  udev,
}:
rustPlatform.buildRustPackage {
  pname = "swhkd";
  version = "unstable";

  src = fetchFromGitHub {
    owner = "waycrate";
    repo = "swhkd";
    rev = "ae372e0aff2e87fbfed11d79bcd7fd9ef5f68a60";
    hash = "sha256-EhbRIlI+RsZjPjbYmgu4WzOHJ8udTtlxgJ2kr9iHyd0=";
  };

  cargoHash = "sha256-LBbmFyddyw7vV5voctXq3L4U3Ddbh428j5XbI+td/dg=";

  cargoBuildFlags = [
    "--features no_rfkill"
  ];

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    udev
  ];

  postBuild = ''
    $src/scripts/build-polkit-policy.sh --swhkd-path=$out/bin/swhkd
  '';

  postInstall = ''
    install -D -m0444 ./com.github.swhkd.pkexec.policy -t $out/share/polkit-1/actions
  '';

  meta = with lib; {
    description = "A drop-in replacement for sxhkd that works with wayland";
    homepage = "https://github.com/waycrate/swhkd";
    license = licenses.bsd2;
  };
}
