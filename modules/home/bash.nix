{ config, lib, host ? "desktop", ... }:
let
  cfg = config.home.bash;
in
{
  options.home.bash = {
    enable = lib.mkEnableOption "powłoka Bash";
  };

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        fastfetch
        if [ -f $HOME/.bashrc-personal ]; then
          source $HOME/.bashrc-personal
        fi
      '';
      shellAliases = {
        sv = "sudo nvim";
        fr = "nh os switch --hostname ${host}";
        fu = "nh os switch --hostname ${host} --update";
        ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
        v = "nvim";
        cat = "bat";
        ".." = "cd ..";
      };
    };
  };
}
