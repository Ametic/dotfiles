{ pkgs, config, lib, ... }:
let
  cfg = config.core.services;
in
{
  options.core.services = {
    enable = lib.mkEnableOption "usługi systemowe (PipeWire, SSH, udisks2, itp.)";
  };

  config = lib.mkIf cfg.enable {
    services = {
      libinput.enable = true;
      fstrim.enable = true;
      udisks2 = {
        enable = true;
        mountOnMedia = true;
      };
      gvfs.enable = true;
      openssh = {
        enable = true;
        settings = {
          PermitRootLogin = "no";
          PasswordAuthentication = true;
          KbdInteractiveAuthentication = true;
        };
        ports = [ 22 ];
      };
      gnome.gnome-keyring.enable = true;
      # Audio
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        extraConfig.pipewire."92-low-latency" = {
          "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 256;
            "default.clock.min-quantum" = 256;
            "default.clock.max-quantum" = 256;
          };
        };
        extraConfig.pipewire-pulse."92-low-latency" = {
          context.modules = [
            {
              name = "libpipewire-module-protocol-pulse";
              args = {
                pulse.min.req = "256/48000";
                pulse.default.req = "256/48000";
                pulse.max.req = "256/48000";
                pulse.min.quantum = "256/48000";
                pulse.max.quantum = "256/48000";
              };
            }
          ];
        };
      };
    };
  };
}
