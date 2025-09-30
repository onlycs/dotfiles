{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    prismlauncher

    # Communication
    slack
    signal-desktop

    # Media
    pavucontrol
    mpv

    # Graphics & Design
    gimp
    inkscape

    # Productivity
    libreoffice
    obsidian
    proton-pass

    # System utilities
    gnome-system-monitor
    gnome-disk-utility

    # File management
    nautilus
    nautilus-open-any-terminal
    gvfs

    # Internet
    qbittorrent
  ];
}
