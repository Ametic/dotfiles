{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        audacity
        discord
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
        filezilla
        element-desktop
        thunderbird
        osu-lazer-bin
        obsidian
        luanti
    ]; 
}