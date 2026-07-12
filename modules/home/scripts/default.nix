{
  config,
  pkgs,
  username,
  profile,
  ...
}: {
  home.packages = [
    (import ./emopicker9000.nix {inherit pkgs;})
    (import ./hm-find.nix {inherit pkgs;})
    (import ./keybinds.nix {inherit pkgs;})
    (import ./note.nix {inherit pkgs;})
    (import ./note-from-clipboard.nix {inherit pkgs;})
    (import ./rofi-launcher.nix {inherit pkgs;})
    (import ./screenshootin.nix {inherit pkgs;})
    (import ./squirtle.nix {inherit pkgs;})
    (import ./task-waybar.nix {inherit pkgs;})
    (import ./DropTerminal.nix {inherit pkgs;})
    (import ./wallsetter.nix {
      inherit pkgs;
      inherit username;
    })
    (import ./web-search.nix {inherit pkgs;})
    # Cheatsheets viewer + parser
    (import ./cheatsheets-parser.nix {inherit pkgs;})
    (import ./hyprland-float-all.nix {inherit pkgs;})
    (import ./hyprland-change-layout.nix {inherit pkgs;})
    (import ./launch-nwg-menu.nix {inherit pkgs;})
    (import ./hyprland-dock.nix {inherit pkgs;})
  ];

  xdg.desktopEntries.dropterminal = {
    name = "Drop Terminal";
    comment = "Dropdown terminal (Hyprland)";
    exec = "DropTerminal";
    terminal = false;
    type = "Application";
    icon = "kitty";
    settings.StartupWMClass = "dropterminal";
    categories = ["System" "Utility" "TerminalEmulator"];
  };
}
