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
      amd.enable = true;
      intel.enable = false;
      qmk.enable = true;
      xone.enable = true;
      docker.enable = true;
    };
    flatpak.enable = true;
    fonts.enable = true;
    gaming.enable = true;
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
      rocmSupport = true;
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
