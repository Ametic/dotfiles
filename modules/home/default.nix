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
    ./vscode.nix
    ./xdg.nix
    ./zsh
  ];
}
