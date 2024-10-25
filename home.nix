{ lib, pkgs, nvimFlake, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      zsh
      starship
			eza
			fira-code
			fira-code-symbols
			zinit
      fzf
      zoxide
      nvimFlake.packages.${pkgs.system}.default
    ];
    username = "joshu";
    homeDirectory = "/home/joshu";
    stateVersion = "24.05";
  };
}
