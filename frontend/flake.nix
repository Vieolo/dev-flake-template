{

  inputs = {
    # Flake Utils
    # Used to get the system
    utils.url = "github:numtide/flake-utils";

    # The latest snapshot of packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";


    # Pointing to a specific snapshot of the packages to get
    # specific version of packages
    # Has been taken from nixhub.io for nodejs 18.18.2
    nodejs-18-nixpkgs.url = "github:NixOS/nixpkgs/a71323f68d4377d12c04a5410e214495ec598d4c";
    
    # To take the snapshot for any package, go to nixhub.io, search for the package,
    # find the version, and then use the hash
  };

  outputs = inputs: inputs.utils.lib.eachDefaultSystem (system:
    let
      # Defining variables before the body of outputs

      # Defining pkgs variable for convenience
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      # Defining nodejs18-pkgs variable for convenience
      nodejs18-pkgs = inputs.nodejs-18-nixpkgs.legacyPackages.${system};
    in {
      # Defining the shell
      devShell = pkgs.mkShell {
        buildInputs = [
          # nodejs@18
          nodejs18-pkgs.nodejs_18
          # bun@latest
          pkgs.bun
        ];

        shellHook = ''
          export PS1='\[\e[2m\][\[\e[1m\]nix-shell\[\e[0;2m\]]\[\e[0m\] \[\e[38;5;220;1m\]\W\[\e[0m\] '
        '';
      };
    }
  );
}