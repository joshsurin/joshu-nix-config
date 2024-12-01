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
      gh
      eslint_d
      pnpm
      awscli2
      rustup
    ];
    username = "joshuasurin";
    homeDirectory = "/Users/joshuasurin";
    stateVersion = "24.05";
  };

	fonts.fontconfig.enable = true;
}
