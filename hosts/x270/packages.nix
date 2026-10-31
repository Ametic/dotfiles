{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Multimedia
    easyeffects # Audio effects for PipeWire applications
    video-downloader # Download videos from websites like YouTube and Vimeo
    feishin # Modern self-hosted music player for Subsonic and Navidrome
    spotify # Proprietary music streaming service client
    pear-desktop # Youtube Music client

    # Messengers & Clients
    telegram-desktop # Fast and secure desktop client for Telegram messenger
    element-desktop # Feature-rich client for the Matrix communication protocol
    filezilla # Graphical FTP, FTPS and SFTP client

    # Productivity & Notes
    obsidian # Powerful, local-first markdown note-taking app
    ente-auth # Open-source, end-to-end encrypted 2FA authenticator app
    logseq # Privacy-first, open-source platform for knowledge management and collaboration

    # Tools & Laptop Utilities
    acpi # Show battery and thermal information
    brightnessctl # Control screen and keyboard backlight brightness
    powertop # Analyze power consumption on Intel-based laptops
    nodejs # JavaScript runtime built on Chrome's V8 engine
    ntfs3g # Third-party NTFS read and write driver for Linux

    # Networking & Security
    proton-vpn # Official GUI client for Proton VPN service
  ];
}

