{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Multimedia
    audacity # Open-source digital audio editor and recording application
    easyeffects # Audio effects for PipeWire applications
    kdePackages.kdenlive # Non-linear video editor by KDE
    video-downloader # Download videos from websites like YouTube and Vimeo
    feishin # Modern self-hosted music player for Subsonic and Navidrome
    spotiflac # Tool to download music from Spotify in FLAC format
    spotify # Proprietary music streaming service client
    pear-desktop # Youtube Music client

    # Messengers & Clients
    telegram-desktop # Fast and secure desktop client for Telegram messenger
    element-desktop # Feature-rich client for the Matrix communication protocol
    gajim # Full-featured XMPP/Jabber chat client
    lagrange # Beautiful desktop client for the Gemini inter-network protocol
    filezilla # Graphical FTP, FTPS and SFTP client
    halloy # IRC client written in Rust

    # Games & Launchers
    prismlauncher # Open-source launcher for Minecraft with multi-instance support
    artix-games-launcher # Desktop launcher for Artix Entertainment games
    interlude # YAVSRG
    bolt-launcher # Alternative launcher for RuneScape

    # Productivity & Notes
    obsidian # Powerful, local-first markdown note-taking app
    ente-auth # Open-source, end-to-end encrypted 2FA authenticator app
    logseq # Privacy-first, open-source platform for knowledge management and collaboration

    # Tools
    nodejs # JavaScript runtime built on Chrome's V8 engine
    ntfs3g # Third-party NTFS read and write driver for Linux
    headsetcontrol # Tool to control certain settings on various USB headsets
    droidcam # Tool to use your Android phone as a wireless webcam
    bazaar # Distributed version control system (bzr)
    hugo # Static site generator

    # Launchers
    gearlever # AppImage manager to easily install, manage, and update AppImages
    stremio-linux-shell # Media streaming application framework for movies and TV series

    # Networking & Security
    proton-vpn # Official GUI client for Proton VPN service
  ];
}
