{...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "wl-paste --type text --watch cliphist store" # Saves text
      "wl-paste --type image --watch cliphist store" # Saves images
      "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"
      "hyprland-change-layout init" 
      "start.noctalia"
      #"killall -q awww;sleep .5 && awww-daemon"
      #"killall -q waybar;sleep .5 && waybar"
      #"killall -q swaync;sleep .5 && swaync"
      #"nm-applet --indicator"
      "sh -lc 'sleep 2 && (qs-wallpapers-restore || waypaper --wallpaper $HOME/Pictures/Wallpapers/cave-sunset-view.png --backend awww) >/dev/null 2>&1 || true'"
    ];
  };
}
