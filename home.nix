{ lib, pkgs, nvimFlake, ... }:
{
  home = {
    packages = with pkgs; [
      hello
      zsh
      spaceship-prompt
      nvimFlake.packages.${pkgs.system}.default
    ];
    username = "joshu";
    homeDirectory = "/home/joshu";
    stateVersion = "24.05";
  };
}
