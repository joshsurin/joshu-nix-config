{ config, pkgs, ... }: {
  imports = [
    <nixos-wsl/modules>
  ];
  wsl = {
    enable = true;
    defaultUser = "joshu";
  };
  disabledModules = [ "modules/wsl-conf.nix" ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  users.users.joshu = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  system.stateVersion = "24.05";
}
