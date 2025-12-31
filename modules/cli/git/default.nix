{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.git = {
    enable = true;

    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;

      # SSH transport configuration (default to personal)
      core.sshCommand = "ssh -i ~/.ssh/id_ed25519";
      push.autoSetupRemote = true;

      user = {
        name = "Angad Tendulkar";
        email = "angad@angad.page";
      };
    };
  };
}
