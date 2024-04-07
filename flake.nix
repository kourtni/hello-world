{
  description = "Hello World Monorepo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      repoName = "The World of Helloz";
  in 
  {

    devShells.${system}.default =
      pkgs.mkShell
        {
          buildInputs = [
            pkgs.bazel
            pkgs.vim
          ];

          shellHook = ''
            echo -e "\033[0;31m### Welcome to the ${repoName}. Remember to commit early & often! ###\033[0m"
            echo -e "\033[0;32mThis shell provides the following development tools:\033[0m"
            nix --version
            bazel --version
            echo "vim"
          '';
        };

  };
}
