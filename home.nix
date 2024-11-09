{ lib, pkgs, nvimFlake, ... }:
{
  home = {
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
    username = "joshu";
    homeDirectory = "/home/joshu";
    stateVersion = "24.05";
  };

	fonts.fontconfig.enable = true;
}
