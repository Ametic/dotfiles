{ pkgs, config, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "v4l2loopback" ];
    kernelParams = [ "nohibernate" "usbcore.autosuspend=-1" "mitigations=off" "loglevel=2" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    kernel.sysctl = {
      "kernel.split_lock_mitigate" = 0;
      "vm.max_map_count" = 2147483642;
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "kernel.sched_cfs_bandwidth_slice_us" = 3000;
      "net.ipv4.tcp_fin_timeout" = 5;
      "vm.dirty_ratio" = 3;
      "vm.dirty_bytes" = 50331648; 
      "vm.dirty_background_bytes" = 16777216;
      "vm.dirty_background_ratio" = 2;
      "vm.dirty_expire_centisecs" = 3000;
      "vm.dirty_writeback_centisecs" = 1500;
      "vm.min_free_kbytes" = 59030;
    };
    loader.efi.canTouchEfiVariables = true;
    loader.limine = {
      enable = true;
      efiSupport = true;
      style.wallpapers = [pkgs.nixos-artwork.wallpapers.simple-dark-gray-bottom.gnomeFilePath];
      extraConfig = "timeout:2";
    };
    binfmt.registrations.appimage = {
      wrapInterpreterInShell = false;
      interpreter = "${pkgs.appimage-run}/bin/appimage-run";
      recognitionType = "magic";
      offset = 0;
      mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
      magicOrExtension = ''\x7fELF....AI\x02'';
    };
    tmp.cleanOnBoot = true;
    plymouth.enable = true;
    supportedFilesystems = ["exfat" "btrfs" "ntfs"];
  };

  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "12s";
  };

  powerManagement = {
      enable = true;
      powertop.enable = true;
      cpuFreqGovernor = "performance";
  };
}
