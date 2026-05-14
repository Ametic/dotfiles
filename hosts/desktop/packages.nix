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
        youtube-music
        element-desktop
        osu-lazer-bin
        obsidian
        bazaar
        feishin
        filezilla
        gajim
        protonvpn-gui
        gearlever
        ente-auth
    ]; 
}