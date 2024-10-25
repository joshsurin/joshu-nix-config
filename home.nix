{ lib, pkgs, ... }:
let
  nvimFlake = (builtins.getFlake "path:${toString ./nvim-flake}").packages.${pkgs.system}.default;
in
{
  home = {
    packages = with pkgs; [
      hello
      zsh
      spaceship-prompt
      nvimFlake
    ];
    username = "joshu";
    homeDirectory = "/home/joshu";
    stateVersion = "24.05";
  };
}
