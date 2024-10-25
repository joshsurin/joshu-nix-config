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
            configRC = ''
              imap ww <esc>
              let g:clipboard = {
        \'name': 'WslClipboard',
        \'copy': {
            \'+': 'clip.exe',
            \'*': 'clip.exe',
        \},
        \'paste': {
            \'+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \'*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        \},
        \'cache_enabled': 0,
        \}
        " New vim options
        set autoindent
        set noexpandtab
        set tabstop=2
        set shiftwidth=2
        set relativenumber

	" Key Mappings
	xnoremap <leader>p "_dP
	vnoremap J :m '>+1<CR>gv=gv
	vnoremap K :m '<-2<CR>gv=gv

	" Remap Ctrl+Shift+V to Ctrl+V for visual block mode
	nmap <C-I> <C-V>
	vmap <C-I> <C-V>
            '';
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
