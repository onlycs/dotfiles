{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    # System info
    neofetch

    # Archives
    zip
    xz
    unzip
    p7zip

    # Utils
    ripgrep
    jq
    fzf

    # Development tools
    rustc
    cargo
    sccache

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
  ];
}
