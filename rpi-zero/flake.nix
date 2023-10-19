{
  description = "Buildroot for th eMiSTeX hard processor system";
  nixConfig.bash-prompt = "[nix(MiSTeX)] ";

  # Nixpkgs / NixOS version to use.
  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  outputs = { self, nixpkgs, flake-utils, ... }:
    let

      # to work with older version of flakes
      lastModifiedDate =
        self.lastModifiedDate or self.lastModified or "19700101";

      # Generate a user-friendly version number.
      version = builtins.substring 0 8 lastModifiedDate;

      # System types to support.
      supportedSystems =
        [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
    in {

      # Provide some binary packages for selected system types.
      packages = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
          inherit (pkgs) lib callPackage stdenv fetchgit fetchFromGitHub;
        in rec {
          mistex-buildroot = callPackage ./nix/mistex-buildroot.nix { };
          default = mistex-buildroot;
        });

      # contains a mutually consistent set of packages for a full toolchain using nextpnr-xilinx.
      devShell = forAllSystems (system:
        nixpkgsFor.${system}.mkShell {
          buildInputs = with self.packages.${system};
                        with nixpkgsFor.${system}; [
            # use Ubuntu toolchain to compile buildroot
          ];

          shellHook =
            let mypkgs  = self.packages.${system};
                nixpkgs = nixpkgsFor.${system};
            in nixpkgs.lib.concatStrings [
              ""
            ];
        }
      );
    };
}
