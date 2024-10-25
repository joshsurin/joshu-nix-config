{ lib, pkgs, ... }:
let
    nvimFlake = builtins.getFlake ./nvim-flake.nix;
    neovimWithConfig = nvimFlake.packages.${pkgs.system}.default;
in
{
    home = {
	packages = with pkgs; [
	    hello
	    zsh
	    spaceship-prompt
	    neovimWithConfig
	];

	username = "joshu";
	homeDirectory = "/home/joshu";

	stateVersion = "24.05";
    };
}
