{ lib, pkgs, ... }:
{
    home = {
	packages = with pkgs; [
	    cowsay lolcat
	];

	username = "joshu";
	homeDirectory = "/home/joshu";

	stateVersion = "24.05";
    };
}
