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
    ./stylix.nix
    ./system.nix
    ./user.nix
    inputs.stylix.nixosModules.stylix
  ];
}
