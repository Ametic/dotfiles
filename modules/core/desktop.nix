{ pkgs, config, lib, ... }:
let
  cfg = config.core.desktop;
  sddm-astronaut = pkgs.sddm-astronaut;
in
{
  options.core.desktop = {
    enable = lib.mkEnableOption "środowisko graficzne (Plasma 6 + SDDM)";
  };

  config = lib.mkIf cfg.enable {
    services = {
      xserver = {
        enable = true;
        xkb.layout = "pl";
        xkb.variant = "";
      };
      desktopManager = {
        plasma6.enable = true;
      };
      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
          theme = "sddm-astronaut-theme";
          extraPackages = [ sddm-astronaut ];
        };
      };
    };
    environment.systemPackages = [ sddm-astronaut ];
  };
}

