{ lib, pkgs, nvimFlake, ... }:
{
	programs.home-manager.enable = true;
	fonts.fontconfig.enable = true;
	home = {
	username = "joshu";
	homeDirectory = "/home/joshu";
	stateVersion = "24.05";
	shell = pkgs.zsh;
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
}
