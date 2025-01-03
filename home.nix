{ lib, pkgs, nvimFlake, systemType, ... } @ args:
let
  username = if systemType == "mac" then "joshuasurin" else "joshu";
  homeDirectory = if systemType == "mac" then "/Users/joshuasurin" else "/home/joshu";
in
{
  imports = [
    ./theming.nix
  ];
	programs.home-manager.enable = true;
	fonts.fontconfig.enable = true;
	home = {
	username = username;
	homeDirectory = homeDirectory;
	stateVersion = "24.05";
	file = {
		".zshrc".source = ./zshrc;
		".config/starship.toml".source = ./starship/tokyonight.toml;
    ".config/ghostty/config".source = ./ghostty;
	};
	packages = with pkgs; [
      # system stuff
      hello
      bat
      zsh
      aria2
      xclip
      starship
      eza
      zinit
      fzf
      zoxide
      ripgrep
      fontconfig
      fira-code
      fira-code-nerdfont
      gh
      tmux
      tmuxp
      nvimFlake.packages.${pkgs.system}.default

      # devops stuff
      k9s
      kubectx
      awscli2
      kubectl

      # languages stuff
      haskellPackages.haskell-language-server
      haskellPackages.cabal-install
      ghc

      # yarn
      pnpm
      nodejs_18
      # nodejs_20
      eslint_d

      rustup
		];
	};

  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
    };
		starship = {
			enable = true;
		};
    git = {
      enable = true;
      userName = "joshsurin";
      userEmail = "joshua.surin@gmail.com";
    };
  };

  services = {
  };
}
