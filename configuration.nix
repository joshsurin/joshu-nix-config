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

  programs.zsh.enable = true;
  environment.shells = [pkgs.zsh];
  users.users.joshu.shell = pkgs.zsh;

  system.stateVersion = "24.05";
}
