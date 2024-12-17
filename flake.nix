{
  description = "Raylib development environment";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"; };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      raylib = import ./raylib.nix { inherit pkgs; };
    in {
      devShells."${system}".default = pkgs.mkShell {
        PKG_CONFIG_PATH = "${raylib}";
        packages = with pkgs; [
          # raylib itself
          raylib

          # OpenGL calls
          libGL

          # X11 dependencies
          # xorg.libX11
          xorg.libX11.dev
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXrandr
          xorg.libXft
          pkg-config

          # LSP
          bear

          # Uncomment the line below if you want to build Raylib with web support
          # emscripten
        ];
      };
    };
}
