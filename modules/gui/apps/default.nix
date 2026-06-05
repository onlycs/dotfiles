{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # video games
    prismlauncher

    # desktop
    quickshell

    # Communication
    slack
    signal-desktop
    gnome-contacts
    thunderbird-bin

    # Media
    pavucontrol
    mpv
    qbz
    crosspipe
    pwvucontrol
    loupe
    ffmpeg
    wf-recorder

    # Graphics & Design
    gimp
    inkscape
    kdePackages.kdenlive
    obs-studio

    # Productivity
    libreoffice
    obsidian
    gnome-calculator

    # System utilities
    mission-center
    gnome-disk-utility
    gnome-text-editor
    gnome-control-center
    gcr

    # File management
    nautilus
    nautilus-open-any-terminal
    sushi

    # code
    android-studio
    vscode
    (google-antigravity.override { useFHS = false; })
    claude-code
    godot
    winboat

    # Internet
    qbittorrent

    # FRC
    choreo
    elastic-dashboard

    # font
    texlivePackages.tex-gyre
    inter

    pinentry-qt
  ];
}
