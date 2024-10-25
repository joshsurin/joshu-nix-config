{ lib, pkgs, ... }:
let
  nvimFlake = (import ./nvim-flake.nix {
    inherit pkgs;
  }).packages.${pkgs.system}.default;
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
