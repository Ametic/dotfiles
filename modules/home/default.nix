{ host, ... }:
{
  imports = [
    ./bash.nix
    ./bashrc-personal.nix
    ./btop.nix
    ./cava.nix
    # Desktops
    ./desktops/hyprland
    #./desktops/plasma
    ./emoji.nix
    ./eza.nix
    ./fastfetch
    ./fzf.nix
    ./git.nix
    ./gtk.nix
    ./htop.nix
    ./kitty.nix
    ./nixcord.nix
    ./scripts
    ./stylix.nix
    ./vscode.nix
    ./xdg.nix
    ./yazi
    ./zsh
  ];
}
