{ pkgs, inputs, username ? "jakub", host ? "desktop", profile ? "desktop", ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs username host profile; };
    users.jakub = {
      imports = [ ./../home ];
      home = {
        username = "jakub";
        homeDirectory = "/home/jakub";
        stateVersion = "25.05";
      };
    };
  };
  users.mutableUsers = true;
  users.users.jakub = {
    isNormalUser = true;
    description = "Ametic";
    extraGroups = [
      "adbusers"
      "docker"
      "libvirtd"
      "lp"
      "networkmanager"
      "scanner"
      "wheel"
      "vboxusers"
    ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
  nix.settings.allowed-users = [ "jakub" ];
}
