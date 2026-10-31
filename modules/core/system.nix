{ config, lib, ... }:
let
  cfg = config.core.system;
in
{
  options.core.system = {
    enable = lib.mkEnableOption "podstawowe ustawienia systemu, locale i Nix";
  };

  config = lib.mkIf cfg.enable {
    environment.sessionVariables = {
      CURL_HTTP_VERSION = "1.1";
    };
    nix.settings = {
      download-buffer-size = 200000000;
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    time.timeZone = "Europe/Warsaw";
    i18n.defaultLocale = "pl_PL.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "pl_PL.UTF-8";
      LC_IDENTIFICATION = "pl_PL.UTF-8";
      LC_MEASUREMENT = "pl_PL.UTF-8";
      LC_MONETARY = "pl_PL.UTF-8";
      LC_NAME = "pl_PL.UTF-8";
      LC_NUMERIC = "pl_PL.UTF-8";
      LC_PAPER = "pl_PL.UTF-8";
      LC_TELEPHONE = "pl_PL.UTF-8";
      LC_TIME = "pl_PL.UTF-8";
    };
    console.keyMap = "pl";
    system.stateVersion = "25.05";
  };
}
