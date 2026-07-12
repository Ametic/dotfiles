{ host, ... }:
{
  imports = [
    ./bash.nix
    ./bashrc-personal.nix
    ./btop.nix
    ./cava.nix
    ./fastfetch
    ./git.nix
    ./gtk.nix
    ./nixvim.nix
    ./htop.nix
    ./hyprland
    ./kitty.nix
    ./nixcord.nix
    ./scripts
    ./stylix.nix
    ./vscode.nix
    ./xdg.nix
    ./zsh
    ./rofi
    ./waybar/waybar.nix
    ./wlogout/wlogout.nix
    ./swaync.nix
  ];
}
