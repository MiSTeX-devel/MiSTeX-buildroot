{ pkgs ? import (builtins.fetchTree {
                  type = "github";
                  owner = "nixos";
                  repo = "nixpkgs";
                  rev = "fba68a9b964e961307237d7da745121f9bc00fa8";
                }) {} }:

pkgs.mkShell {
  NIX_HARDENING_ENABLE = "";
  packages = with pkgs; [
    which
    pkg-config
    cmake
    unzip
    bc
    cpio
    wget
    rsync
    libxcrypt
  ];
}