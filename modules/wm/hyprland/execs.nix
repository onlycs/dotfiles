let
  variables = import ./variables.nix;
in {
  exec-once = [
    # Keyring and auth
    "gnome-keyring-daemon --start --components=secrets"
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

    # Clipboard history
    "wl-paste --type text --watch cliphist store"
    "wl-paste --type image --watch cliphist store"

    # Auto delete trash 30 days old
    "trash-empty 30"

    # Cursors
    "hyprctl setcursor ${variables.cursorTheme} ${toString variables.cursorSize}"
    "gsettings set org.gnome.desktop.interface cursor-theme '${variables.cursorTheme}'"
    "gsettings set org.gnome.desktop.interface cursor-size ${toString variables.cursorSize}"

    # Forward bluetooth media commands to MPRIS
    "mpris-proxy"

    # Resize and move windows based on matches (e.g. pip)
    "caelestia resizer -d"

    # Start shell
    "caelestia shell -d"
  ];
}
