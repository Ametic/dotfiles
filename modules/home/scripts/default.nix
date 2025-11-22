{ pkgs
, username
, profile
, ...
}: {
  home.packages = [
    (import ./emopicker9000.nix { inherit pkgs; })
    (import ./hm-find.nix { inherit pkgs; })
    (import ./idle-toggle.nix { inherit pkgs; })
    (import ./keybinds.nix { inherit pkgs; })
    (import ./rofi-launcher.nix { inherit pkgs; })
    (import ./screenshootin.nix { inherit pkgs; })
    (import ./task-waybar.nix { inherit pkgs; })
    (import ./wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
  ];
}
