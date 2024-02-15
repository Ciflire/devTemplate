# flake.nix
{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      #       ↑ Swap it for your system if needed
      #       "aarch64-linux" / "x86_64-darwin" / "aarch64-darwin"

      typstPkgs = with pkgs; [ typst typst-lsp typstfmt ];
      cPkgs = with pkgs; [ clang-tools_17 ];
      javaPkgs = with pkgs; [ gradle jdk jdt-language-server ];
      htmlPkgs = with pkgs; [ vscode-langservers-extracted emmet-ls ];
      pythonPkgs = with pkgs; [ python3 ruff-lsp black ];
      rustPkgs = with pkgs; [ cargo rustc rust-analyzer rustfmt ];
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default =
        pkgs.mkShell # .override { stdenv = pkgs.clangStdenv; } # for C dev
        {
          packages = [ ];
          shellHook = "";
        };

    };
}
