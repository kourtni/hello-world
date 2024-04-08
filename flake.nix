{ # This flake is heavily cribbed from
  # https://github.com/tweag/rules_nixpkgs/blob/master/guide.md#nix-development-shells

  description = "Hello World Monorepo";

  inputs = {
    # Track a specific tag on the nixpkgs repo.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    # The flake format itself is very minimal, so the use of this
    # library is common. For more details see:
    # https://github.com/numtide/flake-utils
    flake-utils.url = "github:numtide/flake-utils";
  };

  # Here we can define various kinds of "outputs": packages, tests, 
  # and so on, but we will only define a development shell.
  outputs = { nixpkgs, flake-utils, ... }:

    # For every platform that Nix supports, we ...
    flake-utils.lib.eachDefaultSystem (system:
      let
          # ... get the package set for this particular platform ...
          pkgs = nixpkgs.legacyPackages.${system};
          repoName = "The World of Helloz";
      in 
      {

        # ... and define a development shell for it ...
        devShells.default =

          # ... with no globally-available CC toolchain ...
          pkgs.mkShellNoCC {
            name = "rules_nixpkgs_shell";

            # ... which makes available the following dependencies, 
            # all sourced from the `pkgs` package set:
            packages = with pkgs; [
              bazel
              bazel-buildtools
              vim
            ];

            shellHook = ''
              echo -e "\033[0;31m### Welcome to the ${repoName}. Remember to commit early & often! ###\033[0m"
              echo -e "\033[0;32mThis shell provides the following development tools:\033[0m"
              nix --version
              bazel --version
              echo "vim"
            '';
          };
      });
}
