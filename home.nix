{ lib, pkgs, nvimFlake, ... }:
{
	programs.home-manager.enable = true;
	fonts.fontconfig.enable = true;
	home = {
	username = "joshu";
	homeDirectory = "/home/joshu";
	stateVersion = "24.05";
	packages = with pkgs; [
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
		nvimFlake.packages.${pkgs.system}.default
		fira-code
		fira-code-nerdfont

		pnpm
		nodejs_18

		rustup
		];
	};

  programs = {
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

  home.language.base = "en_US.UTF-8";

  home.stateVersion = "24.05";

  home.shell = pkgs.zsh;
}
