{ config, lib, ... }:
let
  cfg = config.home.fastfetch;
in
{
  options.home.fastfetch = {
    enable = lib.mkEnableOption "fastfetch";
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;
    };
  };
}
