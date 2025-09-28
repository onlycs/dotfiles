{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    prismlauncher

    # Communication
    slack # Slack desktop client
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

    # System utilities
    gnome-system-monitor
    gnome-disk-utility

    # File management
    nautilus

    # Internet
    qbittorrent
    zed-editor
  ];
}
