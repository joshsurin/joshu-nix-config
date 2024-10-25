{ lib, pkgs, nvimFlake, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      zsh
      starship
			eza
			zinit
      fzf
      zoxide
      nvimFlake.packages.${pkgs.system}.default
			fira-code
			fira-code-nerdfont
    ];
    username = "joshu";
    homeDirectory = "/home/joshu";
    stateVersion = "24.05";
  };

	fonts.fontconfig.enable = true;
}
