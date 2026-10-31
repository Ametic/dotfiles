{ config, lib, ... }:
let
  cfg = config.home.stylix;
in
{
  options.home.stylix = {
    enable = lib.mkEnableOption "konfiguracja celów Stylix w Home Managerze";
  };

  config = lib.mkIf cfg.enable {
    stylix.targets = {
      nixcord.enable = false;
      qt.enable = false;
      waybar.enable = false;
      rofi.enable = false;
      hyprland.enable = false;
      hyprlock.enable = false;
    };
  };
}
