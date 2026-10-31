{ pkgs, config, lib, options, host ? "desktop", ... }:
let
  cfg = config.core.network;
in
{
  options.core.network = {
    enable = lib.mkEnableOption "konfiguracja sieci i NetworkManagera";
  };

  config = lib.mkIf cfg.enable {
    networking = {
      hostName = lib.mkDefault host;
      networkmanager.enable = true;
      enableIPv6 = false;
      dhcpcd.wait = "background";
      dhcpcd.extraConfig = "noarp";
      timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
      nameservers = [ "1.1.1.1" "1.0.0.1" ];
    };
    systemd.services.NetworkManager-wait-online.enable = false;
    environment.systemPackages = with pkgs; [ networkmanagerapplet ];
  };
}
