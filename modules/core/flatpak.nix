{ pkgs, ... }:
{
    xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
        configPackages = [ pkgs.hyprland ];
    };
    services = {
        flatpak = {
            enable = true;
            packages = [
                "com.github.tchx84.Flatseal"
                "org.vinegarhq.Sober"
                "io.github.Soundux"
            ];
            update.onActivation = true;
        };
    };
}