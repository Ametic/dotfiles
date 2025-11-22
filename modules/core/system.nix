{ host, ... }:
{
    # Nix Settings
    nix.settings = {
        download-buffer-size = 200000000;
        auto-optimise-store = true;
        experimental-features = [ "nix-command" "flakes" ];
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
    # TimeZone
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
    # xserver
    services.xserver = {
        enable = true;
        xkb.layout = "pl";
        xkb.variant = "";
    };
    system.stateVersion = "25.05";
}