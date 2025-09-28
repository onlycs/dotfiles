#!/usr/bin/env nu

def main [
    dispatcher: string,     # The hyprctl dispatcher command
    workspace: int          # The workspace number
] {
    let active_ws = (hyprctl activeworkspace -j | from json | get id)
    let target_ws = (($active_ws - 1) // 10) * 10 + $workspace
    hyprctl dispatch $dispatcher $target_ws
}
