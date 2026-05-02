{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/wm/hyprland
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use stable kernel (for NVIDIA driver compatibility)
  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "theseus";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "systemd-resolved";
  # networking.nameservers = [
  #   "192.168.1.2#homelab"
  #   "1.1.1.1#cloudflare"
  #   "8.8.8.8#google"
  # ];
  networking.firewall.enable = false;
  services.resolved = {
    enable = true;
    settings.Resolve.Domains = [ "fios-router.home" ];
  };
  networking.resolvconf.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;

  nix.gc = {
    automatic = true;
    dates = [ "weekly" ];
    options = "--delete-older-than 30d";
  };

  # Time zone
  time.timeZone = "America/New_York";
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

  hardware.flipperzero.enable = true;

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  hardware.xpadneo.enable = true;
  hardware.steam-hardware.enable = true;
  services.blueman.enable = true;

  # Enable fingerprint support
  services.fprintd.enable = true;

  # Enable the X11 windowing system
  services.xserver.enable = false;

  # Firmware updates
  services.fwupd.enable = true;

  # Enable CUPS to print documents
  services.avahi.enable = true;
  services.printing = {
    enable = true;
    drivers = with pkgs; [ brlaser ];
  };

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  services.pipewire.wireplumber.extraConfig."10-bluez-sink" = {
    "monitor.bluez.properties" = {
      "bluez5.roles" = [
        "a2dp_sink"
        "a2dp_source"
        "hsp_hs"
        "hsp_ag"
        "hfp_hf"
        "hfp_ag"
      ];
    };
  };

  # Enable fingerprint authentication for sudo and other services
  security.pam.services.gdm-password.fprintAuth = true;
  security.pam.services.sudo.fprintAuth = true;

  # Power
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # Flatpak
  services.flatpak.enable = true;

  # Define a user account
  users.users.angad = {
    isNormalUser = true;
    description = "angad";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "input"
    ];
    shell = pkgs.nushell;
  };

  programs.nix-ld.enable = true;
  programs.hyprland.enable = true;

  # Gnome etc
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  programs.dconf.enable = true;
  services.gvfs.enable = true;
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

  # Enable Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flake Feature
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
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

  systemd.services.fw-fanctrl = {
    enable = true;
    description = "Framework Laptop Fan Control";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.fw-fanctrl}/bin/fw-fanctrl run";
      Restart = "on-failure";
    };
  };

  # Enable Docker
  virtualisation.docker.enable = true;
  virtualisation.waydroid.enable = true;

  # Remote access
  services.openssh.enable = true;
  networking.wg-quick.interfaces.wg0.configFile = "/home/angad/.dotfiles/angad.theseus.conf";
  services.vscode-server.enable = true;

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
    bitwarden-desktop

    gpu-screen-recorder
    gpu-screen-recorder-gtk
  ];

  environment.shells = with pkgs; [
    bashInteractive
    nushell
  ];

  services.lsfg-vk = {
    enable = true;
    ui.enable = true;
  };

  services.logind = {
    settings = {
      Login = {
        HandleLidSwitch = "suspend";
        HandleLidSwitchExternalPower = "suspend";
        HandleLidSwitchDocked = "ignore";
        IdleAction = "suspend";
        IdleActionSec = "15min";
      };
    };
  };

  security.wrappers.gsr-kms-server = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+ep";
    source = "${pkgs.gpu-screen-recorder}/bin/gsr-kms-server";
  };

  security.polkit.enable = true;

  system.stateVersion = "25.11";
}
