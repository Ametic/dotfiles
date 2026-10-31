{ pkgs, config, lib, ... }:
let
  cfg = config.core.drivers;
in
{
  options.core.drivers = {
    enable = lib.mkEnableOption "sterowniki sprzętowe i grafika";
    amd.enable = lib.mkEnableOption "sterowniki AMD GPU i ROCm";
    intel.enable = lib.mkEnableOption "sterowniki Intel GPU";
    qmk.enable = lib.mkEnableOption "wsparcie dla klawiatur QMK";
    xone.enable = lib.mkEnableOption "sterownik kontrolera Xbox One (xone)";
    docker.enable = lib.mkEnableOption "wirtualizacja Docker";
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;
      };
    }
    (lib.mkIf cfg.amd.enable {
      boot.kernelParams = [
        "amd_pstate=active"
        "video=DP-2:1920x1080@180"
        "video=HDMI-A-1:1920x1080@72"
      ];
      systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
      services.xserver.videoDrivers = [ "amdgpu" ];
    })
    (lib.mkIf cfg.intel.enable {
      services.xserver.videoDrivers = [ "modesetting" ];
      hardware.graphics.extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        vpl-gpu-rt
      ];
    })
    (lib.mkIf cfg.qmk.enable {
      hardware.keyboard.qmk.enable = true;
    })
    (lib.mkIf cfg.xone.enable {
      hardware.xone.enable = true;
    })
    (lib.mkIf cfg.docker.enable {
      virtualisation.docker.enable = true;
    })
  ]);
}
