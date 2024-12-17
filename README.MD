
# Useage

Choose one of the two below Installation methods and you will be able to run:
```bash
nix develop
```

and have full access to Raylib 5.5 via `pkg-config raylib`.

# Installation

There are two main ways to use this repository:

#  Clone it as is so you may tweak `flake.nix` and `raylib.nix` as needed.

> [!TIP]
> The included `Makefile` and `main.c` should build as well and provide a simple example.

## Use this repository as a flake in your own environment:

This will inherit the entire development environment into your own `flake.nix`.

```nix
{
  description = "An example use of raylib-flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    raylib.url = "github:dsunshi/raylib-flake";
  };

  outputs = { raylib, ... }:
    let system = "x86_64-linux";
    in {
      devShells."${system}".default = raylib.devShells."${system}".default;
    };
}
```

> ![CAUTION]
> You still have to build (and link) your code against raylib and other dependencies.

For example:

``` Makefile
CFLAGS=-Wall
CFLAGS+=`pkg-config --cflags raylib`

LIBS=-lGL -lm -lpthread -ldl -lrt
LIBS+=`pkg-config --libs raylib`
LIBS+=`pkg-config --libs x11`

all:
	gcc src/main.c $(CFLAGS) $(LIBS)
```

# Credit

Developed from: https://github.com/gabrieldlima/raylib-template
