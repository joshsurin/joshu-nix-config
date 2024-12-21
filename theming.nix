{ config, pkgs, inputs, ... }:
let
  # Helper function to convert hex colors to terminal colors
  hexToTerminal = hex: "\\e[38;2;${
    toString (pkgs.lib.strings.toInt "16" (builtins.substring 0 2 hex))};${
    toString (pkgs.lib.strings.toInt "16" (builtins.substring 2 2 hex))};${
    toString (pkgs.lib.strings.toInt "16" (builtins.substring 4 2 hex))}m";
in
{
  # Theme Alacritty/Terminal
  programs.alacritty.settings.colors =
    with config.scheme.withHashtag; let default = {
        black = base00; white = base07;
        inherit red green yellow blue cyan magenta;
      };
    in {
      primary = { background = base00; foreground = base07; };
      cursor = { text = base02; cursor = base07; };
      normal = default; bright = default; dim = default;
    };

  # Theme bat (cat replacement)
  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
      style = "plain";
    };
  };

  # Theme dircolors (affects ls, eza, etc)
  programs.dircolors = {
    enable = true;
    settings = with (config.scheme.override {}); {
      # Defaults
      RESET = "0";
      DIR = "01;34";
      LINK = "01;36";
      MULTIHARDLINK = "00";
      FIFO = "40;33";
      SOCK = "01;35";
      DOOR = "01;35";
      BLK = "40;33;01";
      CHR = "40;33;01";
      ORPHAN = "40;31;01";
      MISSING = "00";
      SETUID = "37;41";
      SETGID = "30;43";
      CAPABILITY = "30;41";
      STICKY_OTHER_WRITABLE = "30;42";
      OTHER_WRITABLE = "34;42";
      STICKY = "37;44";
      EXEC = "01;32";

      # Archives
      "*.tar" = "01;31";
      "*.tgz" = "01;31";
      "*.arc" = "01;31";
      "*.zip" = "01;31";
      "*.gz"  = "01;31";
    };
  };

  # Theme Zsh syntax highlighting
  programs.zsh = {
    syntaxHighlighting = {
      enable = true;
      styles = with (config.scheme.override {}); {
        "comment" = "fg=${base03}";
        "command" = "fg=${base0D}";
        "function" = "fg=${base0D}";
        "alias" = "fg=${base0D}";
        "path" = "fg=${base0C}";
        "single-quoted-argument" = "fg=${base0B}";
        "double-quoted-argument" = "fg=${base0B}";
        "global-alias" = "fg=${base0D}";
        "builtin" = "fg=${base0D}";
        "reserved-word" = "fg=${base0E}";
      };
    };
  };
}
