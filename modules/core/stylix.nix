{ pkgs, host, ... }:
{
  stylix = {
    enable = true;
    image = ../../wallpapers/cave-sunset-view.png;
    targets.kmscon.enable = false;
    polarity = "dark";
    opacity.terminal = 1.0;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 9;
        terminal = 12;
        desktop = 9;
        popups = 9;
      };
    };
  };
}
