{ pkgs }:
pkgs.rustPlatform.buildRustPackage {
  pname = "litra-rs";
  version = "2.4.0";

  src = pkgs.fetchFromGitHub {
    owner = "timrogers";
    repo = "litra-rs";
    rev = "v2.4.0";
    sha256 = "sha256-crrMUnP6mQgdJhgj7dmSDtd2DyT3YomthDBQbRKPPbw=";
  };

  cargoHash = "sha256-LAYDUn63C45+xig7ldnbv+5kHjnGOTVv2pRmXJpLaXk=";

  buildInputs = [ pkgs.udev ];
  nativeBuildInputs = [ pkgs.pkg-config ];
}

