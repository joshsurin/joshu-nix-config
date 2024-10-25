{ lib, pkgs, ... }:
{
    home = {
	packages = with pkgs; [
	    hello
	];

	username = "joshu";
	homeDirectory = "/home/joshu";

	stateVersion = "24.05";
    };
}
