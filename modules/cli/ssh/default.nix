{ config, pkgs, lib, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      # Personal GitHub account
      "launchpad" = {
        hostname = "launchpad.angad.page";
        user = "angad";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };
    };

    # Additional SSH configuration
    extraConfig = ''
      # Prevent SSH from prompting for passwords
      PasswordAuthentication no
      PubkeyAuthentication yes

      # Speed up SSH connections
      ControlMaster auto
      ControlPath ~/.ssh/master-%r@%h:%p
      ControlPersist 10m
    '';
  };
}
