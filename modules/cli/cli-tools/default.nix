{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # System info
    fastfetch

    # Archives
    zip
    xz
    unzip
    p7zip

    # Utils
    ripgrep
    fd
    fzf

    # Networking tools
    dnsutils
    aria2

    # Misc
    cmatrix
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    system-config-printer
    cups

    # System call monitoring
    strace
    ltrace
    lsof

    # System tools
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
    killall
    htop

    # Programming
    python3
    nodejs
    qmk
    qmk-udev-rules

    framework-tool
    framework-tool-tui
    fw-fanctrl
    fw-ectool
  ];
}
