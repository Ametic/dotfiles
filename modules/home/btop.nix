{ pkgs, config, lib, ... }:
let
  cfg = config.home.btop;
in
{
  options.home.btop = {
    enable = lib.mkEnableOption "monitor zasobów btop";
    rocmSupport = lib.mkEnableOption "wsparcie AMD ROCm dla btop";
  };

  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
      package = pkgs.btop.override {
        rocmSupport = cfg.rocmSupport;
      };
      settings = {
        vim_keys = true;
        rounded_corners = true;
        proc_tree = true;
        show_gpu_info = "on";
        show_uptime = true;
        show_coretemp = true;
        cpu_sensor = "auto";
        show_disks = true;
        only_physical = true;
        io_mode = true;
        io_graph_combined = false;
      };
    };
  };
}
