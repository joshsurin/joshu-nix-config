{ inputs, outputs, config, pkgs, lib, ... }: 
{
  wsl = {
    enable = true;
    defaultUser = "joshu";
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # users.users.joshu = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ];
  # };

  system.stateVersion = "24.05";
}
