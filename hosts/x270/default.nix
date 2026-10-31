{ ... }:
{
  imports = [
    ./hardware.nix
    ./packages.nix
    ../../modules/core
  ];

  core = {
    boot.enable = true;
    desktop.enable = true;
    drivers = {
      enable = true;
      amd.enable = false;
      intel.enable = true;
      qmk.enable = false;
      xone.enable = false;
      docker.enable = false;
    };
    flatpak.enable = false;
    fonts.enable = true;
    gaming.enable = false;
    network.enable = true;
    packages.enable = true;
    security.enable = true;
    services.enable = true;
    stylix.enable = true;
    system.enable = true;
    user.enable = true;
  };

  home = {
    bash.enable = false;
    bashrc-personal.enable = true;
    btop = {
      enable = true;
      rocmSupport = false;
    };
    cava.enable = true;
    fastfetch.enable = true;
    git.enable = true;
    gtk.enable = true;
    htop.enable = true;
    kitty.enable = true;
    nixcord.enable = true;
    nixvim.enable = true;
    stylix.enable = true;
    vscode.enable = true;
    xdg.enable = true;
    zsh.enable = true;
    zshrc-personal.enable = true;
  };
}

