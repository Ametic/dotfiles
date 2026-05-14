{ inputs, host, ... }:
{
  imports = [
    ./boot.nix
    ./drivers.nix
    ./flatpak.nix
    ./fonts.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
  ];
}
