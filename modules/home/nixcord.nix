{ inputs, config, lib, ... }:
let
  cfg = config.home.nixcord;
in
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  options.home.nixcord = {
    enable = lib.mkEnableOption "klient Discord (Nixcord / Vencord)";
  };

  config = lib.mkIf cfg.enable {
    programs.nixcord = {
      enable = true;
      discord.vencord.enable = true;
      config = {
        useQuickCss = true;
        themeLinks = [
          "https://refact0r.github.io/midnight-discord/build/midnight.css"
        ];
        frameless = true;
        plugins = {
          expressionCloner.enable = true;
          readAllNotificationsButton.enable = true;
          newGuildSettings.enable = true;
          imageZoom.enable = true;
          translate.enable = true;
          musicRichPresence = {
            enable = true;
            hideWithSpotify = true;
            hideWithActivity = true;
            username = "xametic";
            statusName = "Last.FM";
            apiKey = "d5e417a40cfc570fa261a129b37b0370";
            clickableLinks = true;
            shareUsername = true;
            statusDisplayType = "artist";
            useListeningStatus = true;
          };
          messageClickActions.enable = true;
        };
      };
    };
  };
}
