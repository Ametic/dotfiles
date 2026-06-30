{ pkgs, host, options, ...}:
{
    # Network
    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
        enableIPv6 = true;
        dhcpcd.wait = "background";
        dhcpcd.extraConfig = "noarp";
        timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    };
    systemd.services.NetworkManager-wait-online.enable = false;
    environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}