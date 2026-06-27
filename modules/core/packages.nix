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
  };

    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.permittedInsecurePackages = [
        "qtwebengine-5.15.19"
    ];
    nixpkgs.config.packageOverrides = pkgs: {
        curl = pkgs.curl.override {
            http2Support = true;
        };
    };

    environment.systemPackages = with pkgs; [
        appimage-run
        cliphist
        duf
        ffmpeg
        file-roller
        gedit
        gimp
        mesa-demos
        htop
        hyprpicker
        inxi
        killall
        libnotify
        lm_sensors
        mpv
        ncdu
        pavucontrol
        pciutils
        ripgrep
        unrar
        unzip
        uwsm
        v4l-utils
        waypaper
        wget
        nix-output-monitor
        nvd
        ffmpegthumbnailer
        bun
        python314Packages.kde-material-you-colors
    ];
}
