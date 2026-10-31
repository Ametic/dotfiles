{ pkgs, config, lib, ... }:
let
  cfg = config.home.zshrc-personal;
in
{
  options.home.zshrc-personal = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.home.zsh.enable;
      description = "Czy włączyć plik ~/.zshrc-personal.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ zsh ];

    home.file."./.zshrc-personal".text = ''

    # This file allows you to define your own aliases, functions, etc
    # below are just some examples of what you can use this file for
    
      #!/usr/bin/env zsh
      # Set defaults
      #
      #export EDITOR="nvim"
      #export VISUAL="nvim"
   
      #alias c="clear"
     

    '';
  };
}
