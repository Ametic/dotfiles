{ pkgs, config, lib, host ? "desktop", ... }:
let
  cfg = config.home.zsh;
in
{
  imports = [
    ./zshrc-personal.nix
  ];

  options.home.zsh = {
    enable = lib.mkEnableOption "powłoka Zsh z Powerlevel10k";
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      dotDir = config.home.homeDirectory;
      autosuggestion.enable = true;
      syntaxHighlighting = {
        enable = true;
        highlighters = [ "main" "brackets" "pattern" "regexp" "root" "line" ];
      };
      historySubstringSearch.enable = true;

      history = {
        ignoreDups = true;
        save = 10000;
        size = 10000;
      };

      oh-my-zsh = {
        enable = true;
      };

      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = lib.cleanSource ./p10k-config;
          file = "p10k.zsh";
        }
      ];

      initContent = ''
        bindkey "\eh" backward-word
        bindkey "\ej" down-line-or-history
        bindkey "\ek" up-line-or-history
        bindkey "\el" forward-word
        if [ -f $HOME/.zshrc-personal ]; then
          source $HOME/.zshrc-personal
        fi
      '';

      shellAliases = {
        sv = "sudo nvim";
        v = "nvim";
        c = "clear";
        fr = "nh os switch --hostname ${host}";
        fu = "nh os switch --hostname ${host} --update";
        ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        cat = "bat";
        man = "batman";
      };
    };
  };
}
