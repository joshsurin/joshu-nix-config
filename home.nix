{ lib, pkgs, ... }:
let
  nvimFlake = builtins.getFlake (toString ./nvim-flake.nix);
in
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
