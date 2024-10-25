{ lib, pkgs, ... }:
{
    home = {
	packages = with pkgs; [
	    hello
	    zsh
	    spaceship-prompt
	];

	username = "joshu";
	homeDirectory = "/home/joshu";

	stateVersion = "24.05";
    };
}
