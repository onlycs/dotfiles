let
  variables = import ./variables.nix;
in {
  # ######## Window rules ########
  windowrule = [
    "opacity ${toString variables.windowOpacity} override, fullscreen:0"

    "opaque, class:org\\.quickshell|swappy"  # They use native transparency or we want them opaque
    "center 1, floating:1, xwayland:0"  # Center all floating windows

    # Float
    "float, class:org\\.gnome\\.FileRoller"
    "float, class:file-roller"  # WHY IS THERE TWOOOOOOOOOOOOOOOO
    "float, class:blueman-manager"
    "float, class:com\\.github\\.GradienceTeam\\.Gradience"
    "float, class:system-config-printer"
    "float, class:org\\.quickshell"

    # Float, resize and center
    "float, class:org\\.gnome\\.Settings"
    "size 70% 80%, class:org\\.gnome\\.Settings"
    "center 1, class:org\\.gnome\\.Settings"
    "float, class:org\\.pulseaudio\\.pavucontrolr"
    "size 60% 70%, class:org\\.pulseaudio\\.pavucontrol"
    "center 1, class:org\\.pulseaudio\\.pavucontrol"

    # Special workspaces
    "workspace special:sysmon, class:btop|gnome-system-monitor"
    "workspace special:music, class:feishin|Spotify|Supersonic|Cider"

    # Dialogs
    "float, title:(Select|Open)( a)? (File|Folder)(s)?"
    "float, title:File (Operation|Upload)( Progress)?"
    "float, title:.* Properties"
    "float, title:Export Image as PNG"
    "float, title:GIMP Crash Debug"
    "float, title:Save As"
    "float, title:Library"

    # Picture in picture
    "move 100%-w-2% 100%-w-3%, title:Picture(-| )in(-| )[Pp]icture"
    "keepaspectratio, title:Picture(-| )in(-| )[Pp]icture"
    "float, title:Picture(-| )in(-| )[Pp]icture"
    "pin, title:Picture(-| )in(-| )[Pp]icture"

    # Steam
    "rounding 10, title:, class:steam"
    "float, title:Friends List, class:steam"
    "immediate, class:steam_app_[0-9]+"
    "idleinhibit always, class:steam_app_[0-9]+"

    # Ugh xwayland popups
    "nodim, xwayland:1, title:win[0-9]+"
    "noshadow, xwayland:1, title:win[0-9]+"
    "rounding 10, xwayland:1, title:win[0-9]+"
  ];

  # ######## Workspace rules ########
  # workspacerule = [
  #  "w[tv1]s[false], gapsout:${toString variables.singleWindowGapsOut}"
  #  "f[1]s[false], gapsout:${toString variables.singleWindowGapsOut}"
  # ];

  # ######## Layer rules ########
  layerrule = [
    # Fade animation
    "animation fade, hyprpicker"
    "animation fade, logout_dialog"
    "animation fade, selection"
    "animation fade, wayfreeze"

    # Fuzzel
    "animation popin 80%, launcher"
    "blur, launcher"

    # Shell
    "noanim, caelestia-(border-exclusion|area-picker)"
    "animation fade, caelestia-(drawers|background)"
    "blur, caelestia-drawers"
    "ignorealpha 0.57, caelestia-drawers"
  ];
}
