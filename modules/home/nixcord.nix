{ inputs
, pkgs
, ...
}: {
  imports = [ inputs.nixcord.homeModules.nixcord ];
  
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
        lastFmRichPresence = {
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
}
