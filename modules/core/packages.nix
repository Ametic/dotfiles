{ pkgs, inputs, ... }:
{
    programs = {
        firefox.enable = true;
        dconf.enable = true;
        seahorse.enable = false;
        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };
        nh = {
            enable = true;
            clean = {
                enable = true;
                extraArgs = "--keep-since 7d --keep 5";
            };
            flake = "/home/jakub/dotfiles";
        };
        thunar = {
            enable = true;
            plugins = with pkgs.xfce; [
                pkgs.thunar-archive-plugin
                pkgs.thunar-volman
            ];
        };
        nix-ld.enable = true;
        npm.enable = true;
        hyprland = {
            enable = true;
            withUWSM = false;
        };
        hyprlock.enable = true;
  };

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.permittedInsecurePackages = [
        "qtwebengine-5.15.19"
        "electron-39.8.10"
    ];
    nixpkgs.config.packageOverrides = pkgs: {
        curl = pkgs.curl.override {
            http2Support = true;
        };
    };

    environment.systemPackages = with pkgs; [
        
        # Multimedia
        ffmpeg                      # Cross-platform solution to record, convert and stream audio and video
        ffmpegthumbnailer           # Lightweight video thumbnailer for file managers
        gimp                        # GNU Image Manipulation Program (graphics editor)
        mpv                         # Media player based on MPlayer and mplayer2
        v4l-utils                   # Collection of utilities for Video4Linux devices

        # System Tools & Monitoring
        htop                        # Interactive process viewer and system monitor
        inxi                        # Command-line system information tool
        killall                     # Utility to kill processes by name
        lm_sensors                  # Tools for monitoring hardware temperatures and fan speeds
        ncdu                        # NCurses disk usage analyzer
        pavucontrol                 # PulseAudio volume control GUI
        pciutils                    # Utilities for inspecting PCI devices (like lspci)

        # File Management
        file-roller                 # Archive manager for the GNOME desktop
        unrar                       # Utility to extract files from RAR archives
        unzip                       # Utility to unpack and list files from ZIP archives

        # Editors
        cliphist                    # Wayland clipboard manager with support for text and images
        gedit                       # Text editor for the GNOME desktop environment
        ripgrep                     # Line-oriented search tool that recursively searches directories (rg)
        wget                        # Command-line utility for downloading files from the web

        # Utilities
        libnotify                   # Library for sending desktop notifications
        uwsm                        # Universal Wayland Session Manager

        # Tools
        bun                         # Fast all-in-one JavaScript runtime, bundler, test runner, and package manager
        mesa-demos                  # Collection of OpenGL demonstration and benchmarking utilities
        nix-output-monitor          # Pipe nix-build output through this to get a pretty progress graph
        nvd                         # Nix/NixOS package version diff tool

        # Hyprland
        gpu-screen-recorder         # As the name says (Dep for Noctalia)
        power-profiles-daemon       # Dep for Noctalia
        nwg-displays                # Configure monitors via GUI
        nwg-drawer                  # Apps launcher for Wayland
        nwg-dock-hyprland           # Dock for Hyprland
        nwg-menu                    # Apps menu for Wayland
        waybar                      # Hyprland bar 
        waypaper                    # Wallpaper changer
        matugen                     # Dep for Noctalia
        app2unit                    # Dep for Noctalia
	    awww

        # Web Browsers
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default          # Zen Browser
    ];
}
