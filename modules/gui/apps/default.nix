{
  pkgs,
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
    gnome-control-center

    # File management
    nautilus
    nautilus-open-any-terminal
    sushi

    # editor
    jetbrains.idea
    vscode

    # Internet
    qbittorrent
    kdePackages.kdenlive

    helvum
    pwvucontrol

    choreo
    elastic-dashboard
  ];
}
