{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "simple-build-env";
  targetPkgs = pkgs: (with pkgs; [
    gnused
    gawk
    file
    which
    gnumake
    perl
    gcc12
    pkg-config
    cmake
    unzip
    bc
    cpio
    wget
    rsync
  ]);
  runScript = "bash";
}).env