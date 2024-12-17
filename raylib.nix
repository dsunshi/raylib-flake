{ pkgs }:
pkgs.stdenv.mkDerivation {
  # name = pkgName;
  name = "raylib-5.5";

  src = pkgs.fetchFromGitHub {
    owner = "raysan5";
    repo = "raylib";
    rev = "c1ab645ca298a2801097931d1079b10ff7eb9df8";
    sha256 = "sha256-J99i4z4JF7d6mJNuJIB0rHNDhXJ5AEkG0eBvvuBLHrY=";
  };

  nativeBuildInputs = with pkgs; [
    libGL
    # xorg.libX11
    xorg.libX11.dev
    xorg.libXcursor
    xorg.libXi
    xorg.libXinerama
    xorg.libXrandr
    xorg.libXft
  ];

  # prefix=$out
  raylib_pkg = pkgs.writeText "raylib.pc" ''
    exec_prefix=''${prefix}
    includedir=''${prefix}/include
    libdir=''${exec_prefix}/lib

    Name: raylib
    Description: A simple and easy-to-use library to enjoy videogames programming
    URL: https://github.com/raysan5/raylib
    Version: 5.5.0
    Cflags: -I''${includedir}
    Libs: -L''${libdir} -lraylib
  '';

  installPhase = # bash
    ''
      cd src
      make PLATFORM=PLATFORM_DESKTOP
      mkdir -p $out/include
      mkdir -p $out/lib
      cp raylib.h $out/include/
      cp raymath.h $out/include/
      cp rlgl.h $out/include/
      cp libraylib.a $out/lib/
      echo "prefix=$out" > $out/raylib.pc
      cat $raylib_pkg >> $out/raylib.pc
    '';
  # cp $raylib_pkg $out/raylib.pc
}
