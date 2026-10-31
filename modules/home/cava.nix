{ config, lib, ... }:
let
  cfg = config.home.cava;
in
{
  options.home.cava = {
    enable = lib.mkEnableOption "wizualizator audio cava";
  };

  config = lib.mkIf cfg.enable {
    programs.cava = {
      enable = true;
      settings = {
        general = {
          bar_spacing = 1;
          bar_width = 2;
          frame_rate = 60;
        };
      };
    };
  };
}
