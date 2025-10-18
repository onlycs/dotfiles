{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    prismlauncher

    # Communication
    slack
    signal-desktop

    # Media
    pavucontrol
    mpv
    tidal-hifi

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
    jetbrains.idea-ultimate

    kdePackages.kdenlive

    # Internet
    qbittorrent
  ];
}
