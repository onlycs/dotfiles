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
    tidal-hifi

    lsfg-vk
    lsfg-vk-ui

    # Graphics & Design
    gimp
    inkscape

    # Productivity
    libreoffice
    obsidian
    proton-pass

    # System utilities
    mission-center
    gnome-disk-utility
    gnome-text-editor

    # File management
    nautilus
    nautilus-open-any-terminal
    sushi
    jetbrains.idea

    kdePackages.kdenlive

    # Internet
    qbittorrent

    helvum
    pwvucontrol
  ];
}
