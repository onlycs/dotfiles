{
  config,
  pkgs,
  inputs,
  ...
}: {
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

  # Time zone
  time.timeZone = "America/New_York";

  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable hardware graphics acceleration
  hardware.graphics.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Enable fingerprint support
  services.fprintd.enable = true;

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Firmware updates
  services.fwupd.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

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

  # Define a user account
  users.users.angad = {
    isNormalUser = true;
    description = "angad";
    extraGroups = ["networkmanager" "wheel" "docker" "input"];
    shell = pkgs.nushell;
  };

  programs.hyprland.enable = true;

  # Enable fish shell system-wide
  # programs.nushell.enable = true;

  # Install firefox
  # programs.zen-browser.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flake Feature
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable Docker
  virtualisation.docker.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    wget
    vim
    nushell
  ];

  environment.shells = with pkgs; [
    bashInteractive
    nushell
  ];

  security.wrappers.gsr-kms-server = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+ep";
    source = "${pkgs.gpu-screen-recorder}/bin/gsr-kms-server";
  };

  system.stateVersion = "25.05";
}
