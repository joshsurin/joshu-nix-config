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
      fontconfig
      fira-code
      fira-code-nerdfont
      alacritty

      pnpm
      nodejs_18

      rustup
    ];
    username = "joshuasurin";
    homeDirectory = "/Users/joshuasurin";
    stateVersion = "24.05";
  };

	fonts.fontconfig.enable = true;
}
