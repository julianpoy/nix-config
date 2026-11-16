{pkgs}: let
  pname = "chromaforge";
  version = "26.47.0";

  src = pkgs.fetchurl {
    url = "https://github.com/emmertex/chromaforge/releases/download/v${version}/chromaforge-${version}-linux-x86_64.AppImage";
    hash = "sha256-TBeOpkXAPZqoPXlBgfJdsTNnqo+0Da84RlSk5Cw0ADw=";
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
    paths = map wrap ["chromaforge" "chromaforge-cli"];
    postBuild = ''
      cp -r ${extracted}/usr/share $out/share
    '';
  }
