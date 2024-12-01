# joshu-nix-config
config stuff for nix home manager and nvim

run `sudo nixos-rebuild boot --flake .#joshu` or switch instead of boot
home-manager is standalone so run `home-manager switch --flake .#joshu` after to build home-manager config

may need to update flake with `nix flake update` (nvim-flake too if changes made there), might need a github access token which can be added with `NIX_CONFIG='access-tokens = github.com=TOKEN' nix flake update`
