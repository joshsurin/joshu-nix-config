{
    description = "Joshu WSL-NixOS Config";
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
        nvimFlake.url = "path:./nvim-flake";
    };
    outputs = { nixpkgs, home-manager, nvimFlake, nixos-wsl, ... } @ inputs:
        let
            lib = nixpkgs.lib.nixosSystem;
            system = "x86_64-linux";
            pkgs = import nixpkgs { inherit system; };
        in {
            nixosConfigurations = {
                joshu = nixpkgs.lib.nixosSystem {
                    inherit system;
                    modules = [
                        nixos-wsl.nixosModules.wsl
                        ./configuration.nix
                        home-manager.nixosModules.home-manager
                        {
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.users.joshu = import ./home.nix;
                        }
                    ];
                    specialArgs = {
                        inherit inputs nvimFlake;
                    };
                };
            };

            homeConfigurations = {
                joshu = home-manager.lib.homeManagerConfiguration {
                    inherit pkgs;
                    modules = [ 
                      ./home.nix
                      nvimFlake.nixosModules.${system}.hm
                    ];
                };
            };
        };
}
