{ config, lib, ... }:
let
  cfg = config.core.flatpak;
in
{
  options.core.flatpak = {
    enable = lib.mkEnableOption "wsparcie dla Flatpaka i domyślnych aplikacji";
  };

  config = lib.mkIf cfg.enable {
    services = {
      flatpak = {
        enable = true;
        packages = [
          "com.github.tchx84.Flatseal"
          "org.vinegarhq.Sober"
          "io.github.Soundux"
          "it.mijorus.gearlever"
          "info.mumble.Mumble"
        ];
        update.onActivation = true;
      };
    };
  };
}
