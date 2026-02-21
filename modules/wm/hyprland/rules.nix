let
  # exact = s: "^${s}\$";
  antiregex = s: builtins.replaceStrings [ "." ] [ "\\." ] s;
  regexconcat = strs: builtins.concatStringsSep "|" strs;

  floatClass = regexconcat [
    (antiregex "org.gnome.FileRoller")
    "file-roller"
    "blueman-manager"
    (antiregex "com.github.GradienceTeam.Gradience")
    "system-config-printer"
    (antiregex "org.quickshell")
    (antiregex "org.gnome.Settings")
    (antiregex "org.pulseaudio.pavucontrol")
    (antiregex "com.saivert.pwvucontrol")
  ];

  floatResize = regexconcat [
    (antiregex "org.gnome.Settings")
    (antiregex "org.pulseaudio.pavucontrol")
    (antiregex "com.saivert.pwvucontrol")
    (antiregex "org.gnome.Loupe")
    "Bitwarden"
  ];

  titleResize = regexconcat [
    "Select( a)? File(s)?"
    "Open( a)? File(s)?"
    "File (Operation|Upload)( Progress)?"
    "Export Image as PNG"
    "GIMP Crash Debug"
    "Save As"
    "Library"
    "Extension.*Bitwarden"
  ];
in
{
  # ######## Window rules ########
  windowrule = [
    # "match:fullscreen false, opacity ${toString variables.windowOpacity} override"
    {
      name = "center-floating";
      "match:float" = true;
      "match:xwayland" = false;

      center = "on";
    }
    {
      name = "floating";
      "match:class" = floatClass;

      float = "on";
      center = "on";
    }
    {
      name = "resize";
      "match:class" = floatResize;

      float = "on";
      size = "70% 80%";
      center = "on";
    }
    {
      name = "dialogs";
      "match:title" = titleResize;

      float = "on";
      size = "70% 80%";
      center = "on";
    }

    # # Picture in picture
    # "move 100%-w-2% 100%-w-3%, title:Picture(-| )in(-| )[Pp]icture"
    # "keepaspectratio, title:Picture(-| )in(-| )[Pp]icture"
    # "float, title:Picture(-| )in(-| )[Pp]icture"
    # "pin, title:Picture(-| )in(-| )[Pp]icture"

    # Steam
    # "rounding 10, title:, class:steam"
    # "float, title:Friends List, class:steam"
    # "immediate, class:steam_app_[0-9]+"
    # "idleinhibit always, class:steam_app_[0-9]+"
  ];

  # ######## Layer rules ########
  layerrule = [
    # "animation fade, hyprpicker"
    {
      name = "noctalia";
      "match:namespace" = "noctalia-background-.*$";
      ignore_alpha = 0.5;
      blur = true;
      blur_popups = true;
    }
  ];
}
