{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    swappy
    ydotool
    hyprpolkitagent
    hyprshot
    hyprshutdown
    hyprpicker
    hyprland-qtutils # needed for banners and ANR messages
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];
  # Place Files Inside Home Directory
  home.file = {
    "Pictures/Wallpapers" = {
      source = ../../../wallpapers;
      recursive = true;
    };
  };
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    package = pkgs.hyprland;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = ["--all"];
    };
    xwayland = {
      enable = true;
    };
    settings = {
      input = {
        kb_layout = "pl";
        # kb_variant = "";
        kb_options = [
        ];
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          scroll_factor = 0.8;
        };
        force_no_accel = 1;
      };

      gestures = {
        gesture = ["3, horizontal, workspace"];
        workspace_swipe_distance = 500;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = true;
      };
      "$modifier" = "SUPER";

      scrolling = {
        column_width = 0.80;
        fullscreen_on_one_column = true;
        direction = "right";
        follow_focus = true;
      };

      monocle = {};

      general = {
        layout = "dwindle";
        gaps_in = 6;
        gaps_out = 8;
        border_size = 2;
        resize_on_border = true;
        "col.active_border" = "rgb(${config.lib.stylix.colors.base08}) rgb(${config.lib.stylix.colors.base0C}) 45deg";
        "col.inactive_border" = "rgb(${config.lib.stylix.colors.base01})";
      };

      misc = {
        layers_hog_keyboard_focus = true;
        initial_workspace_tracking = 0;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_swallow = false;
        vrr = 2;
        enable_anr_dialog = true;
        anr_missed_pings = 15;
      };

      dwindle = {
        preserve_split = true;
        smart_resizing = true;
        use_active_for_splits = true;
        smart_split = false;
        default_split_ratio = 1.0;
        split_bias = 0;
        precise_mouse_move = false;
        special_scale_factor = 0.8;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          ignore_opacity = false;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      ecosystem = {
        no_donation_nag = true;
        no_update_news = false;
      };

      cursor = {
        sync_gsettings_theme = true;
        no_hardware_cursors = 2;
        enable_hyprcursor = false;
        warp_on_change_workspace = 2;
        no_warps = true;
      };

      render = {
        direct_scanout = 0;
      };

      master = {
        new_status = "slave";
        new_on_top = false;
        new_on_active = "none";
        orientation = "left";
        mfact = 0.55;
        slave_count_for_center_master = 2;
        center_master_fallback = "left";
        smart_resizing = true;
        drop_at_cursor = true;
        always_keep_position = false;
      };

      xwayland = {
        force_zero_scaling = true;
      };
    };

    extraConfig = ''
      monitor=DP-2,1920x1080@180Hz,0x0,1
      monitor=HDMI-A-1,1920x1080@72Hz,1920x0,1
      workspace = 1,monitor:DP-2
      workspace = 2,monitor:DP-2
      workspace = 3,monitor:DP-2
      workspace = 4,monitor:DP-2
      workspace = 5,monitor:DP-2
      workspace = 6,monitor:HDMI-A-1
      workspace = 7,monitor:HDMI-A-1
      workspace = 8,monitor:HDMI-A-1
      workspace = 9,monitor:HDMI-A-1
      workspace = 10,monitor:HDMI-A-1
    '';
  };
}
