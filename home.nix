{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      zsh
      spaceship-prompt
      nvim-flake.packages.${pkgs.system}.default
    ];
    username = "joshu";
    homeDirectory = "/home/joshu";
    stateVersion = "24.05";
  };
}
