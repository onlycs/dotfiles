{ pkgs, lib, ... }:
let
  variables = import ./variables.nix;
  lua = import ./lua.nix { inherit lib; };

  commands = [
    # Keyring and auth
    "gnome-keyring-daemon --start --components=secrets"
    "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"

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
    # "caelestia resizer -d"

    # Start shell
    # "caelestia shell -d"
    "noctalia-shell"
    "bitwarden 2>&1 > /home/angad/bw.log & disown"
  ];

  execs = lib.strings.join "\n" (map (cmd: ''hl.exec_cmd("${cmd}")'') commands);
in
{
  on = lua.args [
    "hyprland.start"
    (lua.inline "function()
      ${execs}
    end")
  ];
}
