{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "launchpad" = {
        hostname = "launchpad.angad.page";
        user = "angad";
        identityFile = "~/.ssh/id_ed25519";
        identitiesOnly = true;
      };

      "jensanity" = {
        hostname = "jensanity";
        user = "angad";
        proxyJump = "launchpad";
        identityFile = "~/.ssh/id_ed25519";
      };

      "databahn" = {
        hostname = "databahn";
        user = "angad";
        proxyJump = "launchpad";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
