{ pkgs, config, ...}:

{
    # AMD GPU
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
    boot.kernelParams = [
        "video=DP-2:1920x1080@180"
        "video=HDMI-A-1:1920x1080@72"
    ];
    systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
    services.xserver.videoDrivers = [ "amdgpu" ];
    hardware.keyboard.qmk.enable = true;
}