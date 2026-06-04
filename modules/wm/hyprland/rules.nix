let
  escdot = s: builtins.replaceStrings [ "." ] [ "\\." ] s;
  regexconcat = strs: builtins.concatStringsSep "|" strs;

  floatClass = regexconcat [
    (escdot "org.gnome.FileRoller")
    "file-roller"
    "blueman-manager"
    (escdot "com.github.GradienceTeam.Gradience")
    "system-config-printer"
    (escdot "org.quickshell")
    (escdot "org.gnome.Settings")
    (escdot "org.pulseaudio.pavucontrol")
    (escdot "com.saivert.pwvucontrol")
  ];

  floatResize = regexconcat [
    (escdot "org.gnome.Settings")
    (escdot "org.pulseaudio.pavucontrol")
    (escdot "com.saivert.pwvucontrol")
    (escdot "org.gnome.Loupe")
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
  window_rule = [
    {
      name = "center-floating";
      match = {
        float = true;
        xwayland = false;
      };

      center = true;
    }
    {
      name = "floating";
      match = {
        class = floatClass;
      };

      float = true;
      center = true;
    }
    {
      name = "resize";
      match = {
        class = floatResize;
      };

      float = true;
      size = [
        "70%"
        "80%"
      ];
      center = true;
    }
    {
      name = "dialogs";
      match = {
        title = titleResize;
      };

      float = true;
      size = [
        "70%"
        "80%"
      ];
      center = true;
    }
    {
      name = "pin-bottom-right";
      match = {
        class = escdot "org.gnome.Calculator";
      };

      float = true;
      size = [
        "30%"
        "10%"
      ];
      move = [
        "(monitor_w-window_w-6)"
        "(monitor_h-window_h-6)"
      ];
      pin = true;
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
  layer_rule = [
    # "animation fade, hyprpicker"
    {
      name = "noctalia";
      match = {
        namespace = "noctalia-background-.*$";
      };

      ignore_alpha = 0.5;
      blur = true;
      blur_popups = true;
    }
  ];
}
