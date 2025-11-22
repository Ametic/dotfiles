{ pkgs, host, options, ...}:
{
    # Network
    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
        timeServers = options.networking.timeServers.default ++ [ "pool.ntp.org" ];
    };
    environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}