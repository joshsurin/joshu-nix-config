{
    description = "Joshu WSL-NixOS Config";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { nixpkgs, home-manager, ... }:
        let
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
        in {
            nixosConfigurations = {
                wsl = nixpkgs.lib.nixosSystem {
                    inherit system;
                    modules = [
                        ./configuration.nix
                        
                        home-manager.nixosModules.home-manager
                        {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.users.joshu = import ./home.nix;
                        }
                    ];
                };
            };

            homeConfigurations = {
                joshu = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    modules = [ ./home.nix ];
                };
            };
        };
}
