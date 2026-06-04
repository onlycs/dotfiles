{
  pkgs,
  lib,
  inputs,
  ...
}:
let
  animations = import ./animations.nix;
  binds = import ./binds.nix { inherit lib; };
  decoration = import ./decoration.nix;
  env = import ./env.nix { inherit pkgs lib; };
  execs = import ./execs.nix { inherit pkgs lib; };
  gestures = import ./gestures.nix;
  group = import ./group.nix;
  input = import ./input.nix;
  rules = import ./rules.nix;
in
{
  home.packages = with pkgs; [
    wl-clipboard
    bibata-cursors
    cliphist
    tesseract
    hyprshot
    hyprpicker
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;

    systemd.variables = [ "--all" ];

    settings = {
      monitor = [
        {
          output = "eDP-2";
          mode = "highres";
          position = "0x0";
          scale = 1.25;
        }
        {
          output = "DP-3";
          mode = "1920x1080@60";
          position = "0x-1080";
          scale = 1;
        }
      ];

      config = {
        general = {
          layout = "dwindle";
          allow_tearing = false; # Allows `immediate` window rule to work
          gaps_workspaces = 20;
          gaps_in = 3;
          gaps_out = 6;
          border_size = 2;
        };

        dwindle = {
          preserve_split = true;
          smart_split = false;
          smart_resizing = true;
        };

        decoration = decoration;
        animations = {
          enabled = true;
        };

        gestures = gestures;
        group = group;
        binds = {
          scroll_event_delay = 0;
        };
        misc = {
          vrr = false;
          animate_manual_resizes = false;
          animate_mouse_windowdragging = false;
          disable_hyprland_logo = true;
          force_default_wallpaper = 0;
          allow_session_lock_restore = true;
          middle_click_paste = false;
          focus_on_activate = true;
          mouse_move_enables_dpms = true;
          key_press_enables_dpms = true;
        };

        xwayland = {
          force_zero_scaling = true;
        };

        ecosystem = {
          no_update_news = true;
        };
      }
      // input;

      device = {
        name = "type:touchpad";
        sensitivity = 0.5;
      };

      env = env;
    }
    // execs
    // binds
    // rules
    // animations;
  };
}
