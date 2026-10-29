{
  pkgs,
  options,
  ...
}:
{
  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
    enableIPv6 = false;
    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
  };
  systemd.services.NetworkManager-wait-online.enable = false;
  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
