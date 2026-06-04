{ pkgs, lib, ... }:

let
  variables = import ./variables.nix;
  lua = import ./lua.nix { inherit lib; };

  env = [
    # ############# Themes #############
    "QT_QPA_PLATFORMTHEME, qt6ct"
    "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
    "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
    "XCURSOR_THEME, ${toString variables.cursorTheme}"
    "XCURSOR_SIZE, ${toString variables.cursorSize}"
    "XCURSOR_PATH, ${pkgs.bibata-cursors}/share/icons"

    # ######## Toolkit backends ########
    "GDK_BACKEND, wayland,x11"
    "QT_QPA_PLATFORM, wayland;xcb"
    "SDL_VIDEODRIVER, wayland,x11,windows"
    "CLUTTER_BACKEND, wayland"
    "ELECTRON_OZONE_PLATFORM_HINT, auto"
    "STEAM_FORCE_DESKTOPUI_SCALING, 1.25"

    # ####### XDG specifications #######
    "XDG_CURRENT_DESKTOP, Hyprland"
    "XDG_SESSION_TYPE, wayland"
    "XDG_SESSION_DESKTOP, Hyprland"

    # ############# Others #############
    "_JAVA_AWT_WM_NONREPARENTING, 1"
  ];
in
map (arg: lua.args (lib.strings.splitString ", " arg)) env
