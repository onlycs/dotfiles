{ lib, ... }: let
  variables = import ./variables.nix;

  wsaction = ../../../scripts/wsaction.nu;

  toWorkspace = map (n:
    "${variables.kbGoToWs}, ${toString n}, exec, nu ${wsaction} workspace ${toString (if n == 0 then 10 else n)}"
  ) (lib.lists.range 0 9);

  winToWorkspace = map (n:
    "${variables.kbMoveWinToWs}, ${toString n}, exec, nu ${wsaction} movetoworkspacesilent ${toString (if n == 0 then 10 else n)}"
  ) (lib.lists.range 0 9);

  workspaceBinds = toWorkspace ++ winToWorkspace ++ [
    "${variables.kbPrevWs}, workspace, -1"
    "${variables.kbNextWs}, workspace, +1"
    "${variables.kbToggleSpecialWs}, exec, caelestia toggle specialws"
  ];

  windowMouseBinds = [
    "Super, mouse:272, movewindow"
    "Super, mouse:273, resizewindow"
  ];

  windowBinds = [
    "${variables.kbPinWindow}, pin"
    "${variables.kbWindowFullscreen}, fullscreen"
    "${variables.kbToggleWindowFloating}, togglefloating"
    "${variables.kbCloseWindow}, killactive"
  ];

  apps = [
    "${variables.kbSystemMonitor}, exec, caelestia toggle sysmon"
    "${variables.kbMusic}, exec, caelestia toggle music"
    "${variables.kbTerminal}, exec, ${variables.terminal}"
    "${variables.kbBrowser}, exec, ${variables.browser}"
    "${variables.kbEditor}, exec, ${variables.editor}"
    "${variables.kbFileExplorer}, exec, ${variables.fileExplorer}"
  ];

  utilities = [
    "Super, V, exec, pkill fuzzel || caelestia clipboard"
    "Super, Period, exec, pkill fuzzel || caelestia emoji -p"
  ];
in {
  extraConfig = ''
    # Execute dispatch and set submap first
    exec = hyprctl dispatch submap global
    submap = global

    bindi = Super, Super_L, global, caelestia:launcher
    bindin = Super, catchall, global, caelestia:launcherInterrupt
    bindin = Super, mouse:272, global, caelestia:launcherInterrupt
    bindin = Super, mouse:273, global, caelestia:launcherInterrupt
    bindin = Super, mouse:274, global, caelestia:launcherInterrupt
    bindin = Super, mouse:275, global, caelestia:launcherInterrupt
    bindin = Super, mouse:276, global, caelestia:launcherInterrupt
    bindin = Super, mouse:277, global, caelestia:launcherInterrupt
    bindin = Super, mouse_up, global, caelestia:launcherInterrupt
    bindin = Super, mouse_down, global, caelestia:launcherInterrupt

    # bindl (locked bindings)
    bindl = ${variables.kbRestoreLock}, exec, caelestia shell -d
    bindl = ${variables.kbRestoreLock}, global, caelestia:lock
    bindl = , XF86MonBrightnessUp, global, caelestia:brightnessUp
    bindl = , XF86MonBrightnessDown, global, caelestia:brightnessDown
    bindl = Ctrl+Super, Space, global, caelestia:mediaToggle
    bindl = , XF86AudioPlay, global, caelestia:mediaToggle
    bindl = , XF86AudioPause, global, caelestia:mediaToggle
    bindl = Ctrl+Super, Equal, global, caelestia:mediaNext
    bindl = , XF86AudioNext, global, caelestia:mediaNext
    bindl = Ctrl+Super, Minus, global, caelestia:mediaPrev
    bindl = , XF86AudioPrev, global, caelestia:mediaPrev
    bindl = , XF86AudioStop, global, caelestia:mediaStop
    bindl = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindl = Super+Shift, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindl = , XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ ${toString variables.volumeStep}%+
    bindl = , XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ ${toString variables.volumeStep}%-
    bindl = , Print, global, caelestia:screenshotFreeze
    bindl = Ctrl, Print, exec, caelestia record -s
    bindl = Super, C, exec, hyprpicker -a

    # Regular bind entries - you'll need to expand these arrays manually
    ${lib.concatMapStrings (bind: "bind = ${bind}\n") (windowBinds ++ workspaceBinds ++ apps ++ utilities)}

    # bindm (mouse bindings)
    ${lib.concatMapStrings (bind: "bindm = ${bind}\n") windowMouseBinds}
  '';
}
