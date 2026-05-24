{ host, ... }:
{
  imports = [
    ./bash.nix
    ./bashrc-personal.nix
    ./btop.nix
    ./cava.nix
    #./desktops/hyprland
    ./eza.nix
    ./fastfetch
    ./git.nix
    ./gtk.nix
    ./nixvim.nix
    ./htop.nix
    ./kitty.nix
    ./nixcord.nix
    #./scripts
    #./stylix.nix
    ./vscode.nix
    ./xdg.nix
    ./zsh
  ];
}
