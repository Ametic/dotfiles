{ pkgs, config, lib, inputs, username ? "jakub", host ? "desktop", profile ? "desktop", ... }:
let
  cfg = config.core.user;
in
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  options = {
    core.user = {
      enable = lib.mkEnableOption "konto użytkownika i integracja z Home Managerem";
    };

    home = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = { };
      description = "Konfiguracja modułów Home Managera przekazywana z poziomu hosta.";
    };
  };

  config = lib.mkIf cfg.enable {
    home-manager = {
      useUserPackages = true;
      useGlobalPkgs = false;
      backupFileExtension = "backup";
      extraSpecialArgs = { inherit inputs username host profile; };
      users.${username} = {
        imports = [
          ./../home
          { home = config.home; }
        ];
        home = {
          username = username;
          homeDirectory = "/home/${username}";
          stateVersion = "25.05";
        };
      };
    };
    users.mutableUsers = true;
    users.users.${username} = {
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
    nix.settings.allowed-users = [ username ];
  };
}
