{
  description = "Nanopass compiler framework in Haskell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: 
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.ghc98 = pkgs.mkShell {
          buildInputs = with pkgs; [
            haskell.compiler.ghc98
            cabal-install
          ];
        };
        devShells.ghc96 = pkgs.mkShell {
          buildInputs = with pkgs; [
            haskell.compiler.ghc96
            cabal-install
          ];
        };
        devShells.ghc94 = pkgs.mkShell {
          buildInputs = with pkgs; [
            haskell.compiler.ghc94
            cabal-install
          ];
        };
        devShells.ghc92 = pkgs.mkShell {
          buildInputs = with pkgs; [
            haskell.compiler.ghc92
            cabal-install
          ];
        };
      }
    );
}
