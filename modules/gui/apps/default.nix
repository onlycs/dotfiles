{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    prismlauncher
    quickshell

    # Communication
    slack
    signal-desktop

    # Media
    pavucontrol
    mpv
    # tidal-hifi

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
    android-studio
    vscode

    # Internet
    qbittorrent
    kdePackages.kdenlive

    crosspipe
    pwvucontrol

    choreo
    elastic-dashboard

    loupe

    texlivePackages.tex-gyre

    winboat

    ffmpeg
    wf-recorder
    gnome-calculator
    obs-studio
    (google-antigravity.override { useFHS = false; })
    kubectl
    claude-code

    uv

    godot
  ];
}
