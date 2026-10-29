{
  pkgs,
  host,
  options,
  ...
}:
{
  # Network
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    enableIPv6 = false; # <---- STEAM SLOW DOWNLOAD SPEEDS REASON, LEAVE IT OFF
    dhcpcd.wait = "background";
    dhcpcd.extraConfig = "noarp";
    timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    nameservers = [ "1.1.1.1" "1.0.0.1" ]; # Cloudflare DNS
  };
  systemd.services.NetworkManager-wait-online.enable = false;
  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
