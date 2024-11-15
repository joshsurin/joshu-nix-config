{
  description = "My neovim config built on top of josephsurin/neovim-flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-flake = {
      url = "github:josephsurin/neovim-flake";
    };
    avante-nvim = {
      url = "github:yetone/avante.nvim";
      flake = false;
    };
  };

  outputs = inputs @ { self, nixpkgs, flake-utils, neovim-flake, avante-nvim }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        defaults = {
          vim = {
            customPlugins = with pkgs.vimPlugins; [
                vim-prettier
								nvim-colorizer-lua
                (pkgs.vimUtils.buildVimPlugin {
                  name = "avante-nvim";
                  src = avante-nvim;
                })
            ];
            lsp = {
              enable = true;
              languages = {
                c = true;
                lua = true;
                nix = true;
                rust = true;
                go = true;
                python = true;
                typescript = true;
                html = true;
                tailwindcss = true;
              };
            };
          };
        };
      in rec {
        apps = rec {
          nvim = {
            type = "app";
            program = "${packages.default}/bin/nvim";
          };

          default = nvim;
        };

        packages = {
          default = (neovim-flake.neovimBuilder.${system} { config = defaults; }).neovim;
        };
      }
    );
}
