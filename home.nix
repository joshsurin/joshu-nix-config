{ lib, pkgs, ... }:
{
	programs.home-manager.enable = true;
	fonts.fontconfig.enable = true;
	home = {
	username = "joshu";
	homeDirectory = "/home/joshu";
	stateVersion = "24.05";
	packages = with pkgs; [
		cowsay
		hello
		zsh
		aria2
		xclip
		starship
		eza
		zinit
		fzf
		zoxide
		ripgrep
		fira-code
		fira-code-nerdfont

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

    git = {
      enable = true;
      userName = "joshsurin";
      userEmail = "joshua.surin@gmail.com";
    };

  };

  services = {
  };
}
