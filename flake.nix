{
    description = "Joshu Nix Config";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixos-wsl = {
            url = "github:nix-community/NixOS-WSL";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-darwin = {
            url = "github:LnL7/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nvimFlake.url = "path:./nvim-flake";
    };
    outputs = { self, nixpkgs, home-manager, nvimFlake, nixos-wsl, nix-darwin, ... } @ inputs:
        let
            inherit (self) outputs;
            lib = nixpkgs.lib.nixosSystem;
            system = "x86_64-linux";
            darwinSystem = "aarch64-darwin";
        in {
            nixosConfigurations = {
                joshu-wsl = nixpkgs.lib.nixosSystem {
                    inherit system;
                    specialArgs = {inherit inputs outputs;};
                    modules = [
                        nixos-wsl.nixosModules.wsl
                        ./configuration.nix
                    ];
                };
            };

            darwinConfigurations = {
                joshu-mac = nix-darwin.lib.darwinSystem {
                    system = darwinSystem;
                    modules = [
                        ./darwin-configuration.nix
                    ];
                };
            };

            homeConfigurations = {
                joshu-wsl = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.${system};
                    modules = [ 
                        ./home.nix
                    ];
                    extraSpecialArgs = {
                        inherit nvimFlake;
                        systemType = "wsl";
                    };
                };

                joshu-mac = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.${darwinSystem};
                    modules = [
                        ./home.nix
                    ];
                    extraSpecialArgs = {
                        inherit nvimFlake;
                        systemType = "mac";
                    };
                };
            };
        };
}
