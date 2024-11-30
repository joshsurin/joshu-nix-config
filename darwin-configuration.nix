{pkgs, ...}: {
  # environment.systemPackages = with pkgs; [
    # use home-manager for system pkgs
  # ];

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = ["Iosevka"];
    })
  ];

  programs.zsh.enable = true;
  environment.shells = [pkgs.zsh];

  nix = {
    useDaemon = true;
    settings.experimental-features = "nix-command flakes";
  };
  services.nix-daemon.enable = true;
  system.stateVersion = 4;
}
