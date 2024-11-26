{ lib, pkgs, nvimFlake, ... }:
{
  home = {
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
      nvimFlake.packages.${pkgs.system}.default
      fontconfig
      fira-code
      fira-code-nerdfont
      alacritty
      k9s
      kubectx

      pnpm
      awscli1

      rustup
    ];
    username = "joshuasurin";
    homeDirectory = "/Users/joshuasurin";
    stateVersion = "24.05";
  };

	fonts.fontconfig.enable = true;
}
