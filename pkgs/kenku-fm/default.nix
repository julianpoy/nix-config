{ pkgs ? import <nixpkgs> {} }:

let
  runtimeLibs = with pkgs; [
    nss
    nspr
    glib
    gtk3
    pango
    cairo
    dbus
    expat
    libuuid
    libsecret
    alsa-lib
    libGL
    libgbm
    systemd

    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXdamage
    xorg.libXcomposite
    xorg.libXi
    xorg.libXtst
  ];
in
pkgs.stdenv.mkDerivation {
  pname = "kenku-fm";
  version = "1.6.2-experimental";

  src = pkgs.fetchzip {
    url = "https://github.com/owlbear-rodeo/kenku-fm/releases/download/v1.6.2-experimental/Kenku.FM-linux-x64-1.6.2-experimental.zip";
    sha256 = "sha256-gFP6A6ixCGJ/xifVKrj/A68/Io89pfefx+hFqkphwqI=";
    stripRoot = false;
  };

  nativeBuildInputs = with pkgs; [
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = runtimeLibs;

  installPhase = ''
    runHook preInstall

    appdir=$(find . -maxdepth 1 -type d -name "Kenku FM-linux-x64" -print -quit)
    if [ -z "$appdir" ]; then
      echo "Could not locate extracted app directory; falling back to current dir"
      appdir="."
    fi

    mkdir -p $out/libexec/kenku-fm
    cp -r "$appdir"/* $out/libexec/kenku-fm/

    mkdir -p $out/bin
    ln -s $out/libexec/kenku-fm/kenku-fm $out/bin/kenku-fm

    # Desktop entry
    mkdir -p $out/share/applications
    cat > $out/share/applications/kenku-fm.desktop <<EOF
    [Desktop Entry]
    Name=Kenku FM
    Comment=Music bot for Discord
    Exec=kenku-fm
    Icon=kenku-fm
    Terminal=false
    Type=Application
    Categories=Multimedia;Application;
    EOF

    mkdir -p $out/share/icons/hicolor/512x512/apps
    cp ${./icon-512x512.png} $out/share/icons/hicolor/512x512/apps/kenku-fm.png

    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/libexec/kenku-fm/kenku-fm \
      --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath runtimeLibs}
  '';

  meta = with pkgs.lib; {
    description = "Kenku FM desktop app for sharing music in Discord voice calls";
    homepage = "https://github.com/owlbear-rodeo/kenku-fm";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
    maintainers = [ ];
  };
}

