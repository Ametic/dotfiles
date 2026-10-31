{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";
    nixcord.url = "github:kaylorben/nixcord";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, nixvim, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "jakub";
      mkHost = host: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs host username;
          profile = host;
        };
        modules = [
          ./hosts/${host}
          nix-flatpak.nixosModules.nix-flatpak
          stylix.nixosModules.stylix
        ];
      };
    in
    {
      nixosConfigurations = {
        desktop = mkHost "desktop";
        x270 = mkHost "x270";
      };
    };
}
