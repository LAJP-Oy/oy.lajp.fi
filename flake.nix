{
  description = "LAJP Oy website - built with Zola";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          default = pkgs.stdenv.mkDerivation {
            pname = "oy-lajp-fi";
            version = "1.0.0";

            src = ./.;

            nativeBuildInputs = [ pkgs.zola ];

            buildPhase = ''
              zola build
            '';

            installPhase = ''
              cp -r public $out
            '';
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.zola
          ];

          shellHook = ''
            echo "LAJP Oy website development environment"
            echo "Commands:"
            echo "  zola serve    - Start dev server with live reload"
            echo "  zola build    - Build production site"
            echo "  zola check    - Validate configuration and links"
          '';
        };

        checks = {
          build = self.packages.${system}.default;
        };
      }
    );
}
