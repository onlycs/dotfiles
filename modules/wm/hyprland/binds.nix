{ lib, ... }:
let
  dispatchFile = ../../../scripts/wsaction.nu;
  ipc = "noctalia-shell ipc call";

  fix0 = n: if n == 0 then 10 else n;
  dispatch = s: n: "nu ${dispatchFile} ${s} ${toString (fix0 n)}";
  keys = lib.lists.range 0 9;
  hyprshot = "hyprshot -m region -s";

  wsSwitch = map (n: "Super, ${toString n}, exec, ${dispatch "switch" n}") keys;
  wsMove = map (n: "Super+Alt, ${toString n}, exec, ${dispatch "move" n}") keys;

  workspaceBinds = wsSwitch ++ wsMove;
  windowMouseBinds = [
    "Super, mouse:272, movewindow"
    "Super, mouse:273, resizewindow"
  ];
  windowBinds = [
    "Super, P, pin"
    "Super, G, fullscreen"
    "Super, W, togglefloating"
    "Super, Q, killactive"
  ];

  apps = [
    "Ctrl+Shift, Escape, exec, ${ipc} systemMonitor toggle"
    "Super, M, exec, caelestia toggle music"
    "Super, T, exec, kitty"
    "Super, F, exec, zen-beta"
    "Super, C, exec, zeditor"
    "Super, E, exec, nautilus"
    "Super, I, exec, ${ipc} settings toggle" # TODO: replace
  ];

  utilities = [
    "Super, V, exec, ${ipc} launcher clipboard"
    "Super, Period, exec, ${ipc} launcher emoji"
    "Super, Print, exec, ${hyprshot} -o ~ -f .tmp.png; tesseract ~/.tmp.png - | wl-copy && rm ~/.tmp.png"
  ];
in
{
  extraConfig = ''
    # Execute dispatch and set submap first
    exec = hyprctl dispatch submap global
    submap = global

    bind = Super, Super_L, exec, ${ipc} launcher toggle

    # bindl (locked bindings)
    bindl = Super, L, exec, ${ipc} lockScreen lock
    bindl = , XF86MonBrightnessUp, exec, ${ipc} brightness increase
    bindl = , XF86MonBrightnessDown, exec, ${ipc} brightness decrease
    bindl = , XF86AudioPlay, exec, ${ipc} media playPause
    bindl = , XF86AudioNext, exec, ${ipc} media next
    bindl = , XF86AudioPrev, exec, ${ipc} media previous
    bindl = , XF86AudioMute, exec, ${ipc} volume muteOutput
    bindl = , XF86AudioRaiseVolume, exec, ${ipc} volume increase
    bindl = , XF86AudioLowerVolume, exec, ${ipc} volume decrease
    bindl = , Print, exec, ${hyprshot} -o ~/Pictures/Screenshots -- loupe
    bindl = Super, C, exec, hyprpicker -a

    # Regular bind entries - you'll need to expand these arrays manually
    ${lib.concatMapStrings (bind: "bind = ${bind}\n") (
      windowBinds ++ workspaceBinds ++ apps ++ utilities
    )}

    # bindm (mouse bindings)
    ${lib.concatMapStrings (bind: "bindm = ${bind}\n") windowMouseBinds}
  '';
}
