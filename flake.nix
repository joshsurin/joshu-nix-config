{
    description = "Joshu Home Manager config";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";

	home-manager = {
	    url = "github:nix-community/home-manager/release-24.05";
	    inputs.nixpkgs.follows = "nixpkgs";
	};

	nvimFlake.url = "path:./nvim-flake";
    };

    outputs = { nixpkgs, home-manager, nvimFlake, ... }:
	let
	    lib = nixpkgs.lib;
	    system = "x86_64-linux";
	    pkgs = import nixpkgs { inherit system; };
	in {
	    homeConfigurations = {
		joshu = home-manager.lib.homeManagerConfiguration {
		    inherit pkgs;
		    modules = [ ./home.nix ];
		    extraSpecialArgs = {
			inherit nvimFlake;
		    };
		};
	    };
	};
}
