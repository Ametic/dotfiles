{ inputs, host, ... }:
{
  imports = [
    ./boot.nix
    ./drivers.nix
    ./flatpak.nix
    ./fonts.nix
    ./gaming.nix
    ./network.nix
    ./packages.nix
    ./security.nix
    ./services.nix
    #g./stylix.nix
    ./system.nix
    ./user.nix
    #inputs.stylix.nixosModules.stylix
  ];
}
