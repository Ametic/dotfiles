{ pkgs, config, lib, ... }:
let
  cfg = config.core.boot;
in
{
  options.core.boot = {
    enable = lib.mkEnableOption "konfiguracja bootloadera (Limine) i jądra";
  };

  config = lib.mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      kernelModules = [ "v4l2loopback" ];
      extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
      extraModprobeConfig = ''
        options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
      '';
      kernelParams = [
        "quiet"
        "splash"
        "boot.shell_on_fail"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
        "usbcore.autosuspend=-1"
        "mitigations=off"
      ];
      kernel.sysctl = {
        "kernel.split_lock_mitigate" = 0;
        "vm.max_map_count" = 2147483642;
        "vm.swappiness" = 10;
        "vm.vfs_cache_pressure" = 50;
        "vm.dirty_ratio" = 10;
        "vm.dirty_background_ratio" = 5;
        "vm.dirty_expire_centisecs" = 3000;
        "vm.dirty_writeback_centisecs" = 1500;
        "net.core.default_qdisc" = "cake";
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.ipv4.tcp_fin_timeout" = 15;
        "fs.inotify.max_user_watches" = 524288;
        "fs.inotify.max_user_instances" = 1024;
      };
      loader = {
        timeout = 2;
        efi.canTouchEfiVariables = true;
        limine = {
          enable = true;
          efiSupport = true;
          maxGenerations = 10;
          style.wallpapers = [ pkgs.nixos-artwork.wallpapers.simple-dark-gray-bottom.gnomeFilePath ];
        };
      };
      tmp.cleanOnBoot = true;
      plymouth.enable = true;
      consoleLogLevel = 0;
      supportedFilesystems = [ "exfat" "btrfs" "ntfs" ];
    };

    programs.appimage = {
      enable = true;
      binfmt = true;
    };

    powerManagement.enable = true;
  };
}
