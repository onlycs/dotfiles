{ lib, ... }:
let
  ipc = "noctalia-shell ipc call";
  hyprshot = "hyprshot -m region -s";
  lua = import ./lua.nix { inherit lib; };

  fix0 = n: if n == 0 then 10 else n;
  keys = lib.lists.range 0 9;

  toggle = ''{ action = "toggle" }'';
  workspace = n: "{ workspace = ${toString (fix0 n)} }";
  nofollow = n: "{ workspace = ${toString (fix0 n)}; follow = false }";

  dsp = action: lib.generators.mkLuaInline "hl.dsp.${action}()";
  dsparg = action: args: lib.generators.mkLuaInline "hl.dsp.${action}(${args})";
  exec = cmd: lib.generators.mkLuaInline ''hl.dsp.exec_cmd("${cmd}")'';

  bind =
    key: act:
    lua.args [
      key
      act
    ];
  bindf =
    key: act: flags:
    lua.args [
      key
      act
      (builtins.listToAttrs (
        map (flag: {
          name = flag;
          value = true;
        }) (if builtins.isList flags then flags else [ flags ])
      ))
    ];
in
{
  bind = [
    (bind "SUPER + P" (dsp "window.pin"))
    (bind "SUPER + G" (dsparg "window.fullscreen" toggle))
    (bind "SUPER + W" (dsparg "window.float" toggle))
    (bind "SUPER + Q" (dsp "window.close"))
  ]
  ++ map (n: (bind "SUPER + ${toString n}" (dsparg "focus" (workspace n)))) keys
  ++ map (n: (bind "SUPER + ALT + ${toString n}" (dsparg "window.move" (nofollow n)))) keys
  ++ [
    (bind "CTRL + SHIFT + Escape" (exec "${ipc} systemMonitor toggle"))
    (bind "SUPER + T" (exec "kitty"))
    (bind "SUPER + F" (exec "zen-beta"))
    (bind "SUPER + E" (exec "nautilus"))
    (bind "SUPER + I" (exec "${ipc} settings toggle"))
  ]
  ++ [
    (bind "SUPER + V" (exec "${ipc} launcher clipboard"))
    (bind "SUPER + C" (exec "hyprpicker -a"))
    (bind "SUPER + Period" (exec "${ipc} launcher emoji"))
    (bind "SUPER + Print" (
      exec "${hyprshot} -o ~ -f .tmp.png; tesseract ~/.tmp.png - | wl-copy && rm ~/.tmp.png"
    ))
  ]
  ++ [
    (bindf "SUPER + SUPER_L" (exec "${ipc} launcher toggle") "release")
    (bindf "SUPER + L" (exec "${ipc} lockScreen lock") "lock")
    (bindf "XF86MonBrightnessUp" (exec "${ipc} brightness increase") "lock")
    (bindf "XF86MonBrightnessDown" (exec "${ipc} brightness decrease") "lock")
    (bindf "XF86AudioPlay" (exec "${ipc} media playPause") "lock")
    (bindf "XF86AudioNext" (exec "${ipc} media next") "lock")
    (bindf "XF86AudioPrev" (exec "${ipc} media previous") "lock")
    (bindf "XF86AudioMute" (exec "${ipc} volume muteOutput") "lock")
    (bindf "XF86AudioRaiseVolume" (exec "${ipc} volume increase") "lock")
    (bindf "XF86AudioLowerVolume" (exec "${ipc} volume decrease") "lock")
    (bindf "Print" (exec "${hyprshot} -o ~/Pictures/Screenshots -- loupe") "lock")
  ]
  ++ [
    (bindf "SUPER + mouse:272" (dsp "window.drag") "mouse")
    (bindf "SUPER + mouse:273" (dsp "window.resize") "mouse")
  ];
}
