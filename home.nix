{ lib, pkgs, nvimFlake, ... }:
{
	programs.home-manager.enable = true;
	fonts.fontconfig.enable = true;
	home = {
	username = "joshu";
	homeDirectory = "/home/joshu";
	stateVersion = "24.05";
	file = {
		".zshrc".source = ./zshrc;
		".config/starship.toml".source = ./starship.toml;
	};
	packages = with pkgs; [
		hello
    bat
		zsh
		aria2
		xclip
		starship
		eza
		zinit
		fzf
		zoxide
		ripgrep
    fontconfig
		fira-code
		fira-code-nerdfont
    k9s
    kubectx
    awscli2
    kubectl
    nvimFlake.packages.${pkgs.system}.default

		pnpm
		nodejs_18

		rustup
		];
	};

  programs = {
    my-neovim.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
    };
		starship = {
			enable = true;
		};
    git = {
      enable = true;
      userName = "joshsurin";
      userEmail = "joshua.surin@gmail.com";
    };
  };

  services = {
  };
}
