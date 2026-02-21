#!/usr/bin/env nu

def main [
    dispatcher_id: string,
    workspace: int
] {
    let active_ws = (hyprctl activeworkspace -j | from json | get id)
    let target_ws = (($active_ws - 1) // 10) * 10 + $workspace
    let dispatcher = match $dispatcher_id {
      "move" => "movetoworkspacesilent",
      "switch" => "workspace",
      _ => $dispatcher_id
    }

    hyprctl dispatch $dispatcher $target_ws
}
