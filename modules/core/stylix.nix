{ pkgs, config, lib, ... }:
let
  cfg = config.core.stylix;
in
{
  options.core.stylix = {
    enable = lib.mkEnableOption "motyw systemowy Stylix";
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      #image = pkgs.nixos-artwork.wallpapers.nineish-catppuccin-mocha.gnomeFilePath;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      targets.kmscon.enable = false;
      polarity = "dark";
      opacity.terminal = 1.0;
      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
      };
      override = {
        base05 = "c0caf5";
        base04 = "b0b0b0";
      };
      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrains Mono";
        };
        sansSerif = {
          package = pkgs.montserrat;
          name = "Montserrat";
        };
        serif = {
          package = pkgs.montserrat;
          name = "Montserrat";
        };
        sizes = {
          applications = 9;
          terminal = 12;
          desktop = 9;
          popups = 9;
        };
      };
    };
  };
}
