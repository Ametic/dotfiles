{ pkgs, config, lib, ... }:
let
  cfg = config.home.gtk;
in
{
  options.home.gtk = {
    enable = lib.mkEnableOption "konfiguracja motywów GTK";
  };

  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };
}
