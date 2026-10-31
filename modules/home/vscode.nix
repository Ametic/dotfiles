{ pkgs, config, lib, ... }:
let
  cfg = config.home.vscode;
in
{
  options.home.vscode = {
    enable = lib.mkEnableOption "edytor Visual Studio Code";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    programs.vscode = {
      enable = true;
      profiles = {
        default = {
          extensions = with pkgs.vscode-extensions; [
            bbenoist.nix
            jeff-hykin.better-nix-syntax
            ms-vscode.cpptools-extension-pack
            mads-hartmann.bash-ide-vscode
            tamasfe.even-better-toml
            zainchen.json
            shd101wyy.markdown-preview-enhanced
            leonardssh.vscord
          ];
        };
      };
    };
  };
}
