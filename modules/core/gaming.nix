{ pkgs, options, inputs, ...}:
{
    programs = {
        gamemode.enable = true;
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            gamescopeSession.enable = true;
            extraCompatPackages = [ pkgs.proton-ge-bin ];
        };
        gamescope = {
            enable = true;
            capSysNice = true;
            args = [ "--rt" "--expose-wayland" ];
        };
    };

    environment.systemPackages = with pkgs; [
        (heroic.override {
            extraPkgs = pkgs': with pkgs'; [
                gamescope
                gamemode
            ];
        })
        mangohud
        protonplus
        winetricks
        faugus-launcher
        hydralauncher
        osu-lazer-bin
        prismlauncher
        lutris
    ];
}