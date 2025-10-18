{ config, pkgs, inputs, ... }: {
  imports = [ ./hardware-configuration.nix ../../modules/wm/hyprland ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use stable kernel (for NVIDIA driver compatibility)
  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "theseus";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "systemd-resolved";
  services.resolved = {
    enable = true;
    domains = [ "fios-router.home" ];
    extraConfig = ''
      DNS=192.168.1.2
    '';
  };
  networking.resolvconf.enable = false;

  # Time zone
  time.timeZone = "America/New_York";

  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable hardware graphics acceleration
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vulkan-loader
      vulkan-tools
      vulkan-headers
      vulkan-validation-layers
      mesa
    ];
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable fingerprint support
  services.fprintd.enable = true;

  # Enable the X11 windowing system
  services.xserver.enable = false;

  # Firmware updates
  services.fwupd.enable = true;

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable fingerprint authentication for sudo and other services
  security.pam.services.gdm-password.fprintAuth = true;
  security.pam.services.sudo.fprintAuth = true;

  # Power
  services.upower.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Define a user account
  users.users.angad = {
    isNormalUser = true;
    description = "angad";
    extraGroups = [ "networkmanager" "wheel" "docker" "input" ];
    shell = pkgs.nushell;
  };

  programs.nix-ld.enable = true;
  programs.hyprland.enable = true;

  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Enable fish shell system-wide
  # programs.nushell.enable = true;

  # Install firefox
  # programs.zen-browser.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flake Feature
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # Parallel downloads
      http-connections = 128;

      # Parallel builds
      max-jobs = "auto";
      cores = 0;

      # Keep build outputs for faster rebuilds
      keep-outputs = true;
      keep-derivations = true;
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  boot.loader.systemd-boot.configurationLimit = 3;

  # Enable Docker
  virtualisation.docker.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    wget
    vim
    nushell

    vulkan-loader
    vulkan-tools
    vulkan-headers
    vulkan-validation-layers
    mesa

    nfs-utils
    polkit_gnome
  ];

  environment.shells = with pkgs; [ bashInteractive nushell ];

  security.wrappers.gsr-kms-server = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+ep";
    source = "${pkgs.gpu-screen-recorder}/bin/gsr-kms-server";
  };

  security.polkit.enable = true;

  system.stateVersion = "25.05";
}
