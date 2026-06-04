{
  programs.ssh = {
    enable = true;
    settings = {
      "Host launchpad" = {
        HostName = "launchpad.angad.page";
        User = "angad";
        IdentityFile = "~/.ssh/id_ed25519";
        IdentitiesOnly = true;
      };
      "Host jensanity" = {
        HostName = "jensanity";
        User = "angad";
        ProxyJump = "launchpad";
        IdentityFile = "~/.ssh/id_ed25519";
      };
      "Host databahn" = {
        HostName = "databahn";
        User = "angad";
        ProxyJump = "launchpad";
        IdentityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
