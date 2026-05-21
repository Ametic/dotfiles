{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        audacity
        nodejs
        easyeffects
        ntfs3g
        spotify
        telegram-desktop
        headsetcontrol
        prismlauncher
        kdePackages.kdenlive
        video-downloader
        droidcam
        pear-desktop
        element-desktop
        obsidian
        bazaar
        feishin
        filezilla
        gajim
        proton-vpn
        gearlever
        ente-auth
        stremio-linux-shell
    ];
}