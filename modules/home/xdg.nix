{ config, lib, ... }:
let
  cfg = config.home.xdg;
in
{
  options.home.xdg = {
    enable = lib.mkEnableOption "domyślne aplikacje i skojarzenia XDG MIME";
  };

  config = lib.mkIf cfg.enable {
    xdg = {
      enable = true;
      mime.enable = true;
      mimeApps = {
        enable = true;
        defaultApplications = {
          "text/html" = [ "floorp.desktop" ];
          "x-scheme-handler/http" = [ "floorp.desktop" ];
          "x-scheme-handler/https" = [ "floorp.desktop" ];
          "x-scheme-handler/about" = [ "floorp.desktop" ];
          "x-scheme-handler/unknown" = [ "floorp.desktop" ];
          "application/zip" = [ "org.gnome.FileRoller.desktop" ];
          "inode/directory" = [ "org.kde.dolphin.desktop" ];
          "video/mp4" = [ "mpv.desktop" ];
        };
      };
    };
  };
}
