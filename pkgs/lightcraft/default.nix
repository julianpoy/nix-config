{pkgs}: let
  pname = "lightcraft";
  version = "0.21.1";

  src = pkgs.fetchurl {
    url = "https://github.com/storytold/lightcraft/releases/download/v${version}/lightcraft-${version}-linux-x86_64.AppImage";
    hash = "sha256-xCEtoid3oAANnrZshbeGXp6ZEfR6YCB9eFK3wGOtqKk=";
  };

  extracted = pkgs.appimageTools.extract {inherit pname version src;};

  wrap = bin:
    pkgs.appimageTools.wrapAppImage {
      pname = bin;
      inherit version;
      src = extracted;
      runScript = "${extracted}/usr/bin/${bin}";
    };
in
  pkgs.symlinkJoin {
    name = "${pname}-${version}";
    paths = map wrap ["lightcraft" "lightcraft-cli"];
    postBuild = ''
      cp -r ${extracted}/usr/share $out/share
    '';
  }
