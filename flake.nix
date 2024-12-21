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
        base16.url = "github:SenchoPens/base16.nix";
        tt-schemes = {
            url = "github:tinted-theming/schemes";
            flake = false;
        };
        base16-zathura = {
            url = "github:haozeke/base16-zathura";
            flake = false;
        };
        base16-vim = {
            url = "github:tinted-theming/base16-vim";
            flake = false;
        };
        nvimFlake.url = "path:./nvim-flake";
    };
    outputs = { self, nixpkgs, home-manager, nvimFlake, nixos-wsl, nix-darwin, base16, ... } @ inputs:
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
                        base16.homeManagerModule
                        {
                            scheme = "${inputs.tt-schemes}/base16/nord.yaml";
                        }
                        ./home.nix
                    ];
                    extraSpecialArgs = {
                        inherit inputs nvimFlake;
                        systemType = "wsl";
                    };
                };

                joshu-mac = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.${darwinSystem};
                    modules = [
                        base16.homeManagerModule
                        {
                            scheme = "${inputs.tt-schemes}/base16/nord.yaml";
                        }
                        ./home.nix
                    ];
                    extraSpecialArgs = {
                        inherit inputs nvimFlake;
                        systemType = "mac";
                    };
                };
            };
        };
}
