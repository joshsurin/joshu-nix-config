{ lib, pkgs, ... }:
{
    home = {
	packages = with pkgs; [
	    lolcat
	];

	username = "joshu";
	homeDirectory = "/home/joshu";

	stateVersion = "24.05";
    };
}
