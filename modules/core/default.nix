{ inputs, ... }:
{
  imports = [
    ./boot.nix
    ./desktop.nix
    ./drivers.nix
    ./flatpak.nix
    ./fonts.nix
    ./gaming.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./stylix.nix
    ./user.nix
  ];
}
