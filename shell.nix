{ pkgs ? import ./nixpkgs.nix }:

let haskellStuff = with pkgs;
        [ 
            haskellPackages.stack
            haskellPackages.haskell-language-server
            ghc
            haskellPackages.cabal-install
            haskellPackages.implicit-hie
            ghcid
            haskellPackages.fourmolu
        ];
    elmStuff = with pkgs;
        [
            nodejs 
	    elmPackages.elm
            elmPackages.elm-test
            elmPackages.elm-format
        ];
    tools = with pkgs;
        [ 
            nixfmt
            git
            curl
        ];
    cloud = with pkgs;
        [
	    awscli2
            kubectl
        ];
    all = haskellStuff ++ elmStuff ++ tools ++ cloud;


in pkgs.mkShell {
  # specify which packages to add to the shell environment
  packages = all;
  # add all the dependencies, of the given packages, to the shell environment
  inputsFrom = with pkgs; all;
}
