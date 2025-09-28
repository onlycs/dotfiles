{
  config,
  pkgs,
  inputs,
  lib,
  osConfig,
  ...
}: let
  animations = import ./animations.nix;
  binds = import ./binds.nix { inherit lib; };
  colors = import ./colors.nix;
  decoration = import ./decoration.nix;
  env = import ./env.nix;
  execs = import ./execs.nix;
  gestures = import ./gestures.nix;
  group = import ./group.nix;
  input = import ./input.nix;
  rules = import ./rules.nix;
  variables = import ./variables.nix;
in {
  home.packages = with pkgs; [
    wl-clipboard
    caelestia-shell-with-cli
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;

    systemd.variables = ["--all"];

    settings = colors // {
      monitor = [
        "eDP-1, highres, 0x0, 1.25"
      ];

      general = {
        layout = "dwindle";
        allow_tearing = false;  # Allows `immediate` window rule to work
        gaps_workspaces = variables.workspaceGaps;
        gaps_in = variables.windowGapsIn;
        gaps_out = variables.windowGapsOut;
        border_size = variables.windowBorderSize;
        #col = {
        #  active_border = variables.activeWindowBorderColour;
        #  inactive_border = variables.inactiveWindowBorderColour;
        #};
      };

      dwindle = {
       	preserve_split = true;
       	smart_split = false;
       	smart_resizing = true;
      };

      misc = {
        vfr = true;
        vrr = 1;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        new_window_takes_over_fullscreen = 2;
        allow_session_lock_restore = true;
        middle_click_paste = false;
        focus_on_activate = true;
        #session_lock_xray = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        background_color = "rgb($surfaceContainer)";
      };

      xwayland = {
        force_zero_scaling = true;
      };

      animations = animations;
      decoration = decoration;
      env = env;
      gestures = gestures;
      group = group;
    } // execs // input // rules;

    extraConfig = binds.extraConfig;
  };
}
