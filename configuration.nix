{ config, pkgs, lib, ... }: {
  imports = [
    <nixos-wsl/modules>
  ];
  wsl = {
    enable = true;
    defaultUser = "joshu";
    wslConf = lib.mkForce {};
  };

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
