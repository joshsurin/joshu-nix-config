{
  description = "My neovim config built on top of josephsurin/neovim-flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-flake = {
      url = "github:josephsurin/neovim-flake";
    };
  };

  outputs = inputs @ { self, nixpkgs, flake-utils, neovim-flake }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        defaults = {
          vim = {
            configRC = ''
                " New vim options
                vim.opt.autoindent = true
                vim.opt.expandtab = false
                vim.opt.tabstop = 2
                vim.opt.shiftwidth = 2
                vim.opt.relativenumber = true
            '';
            customPlugins = with pkgs.vimPlugins; [
                vim-prettier
								nvim-colorizer-lua
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
