{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;

    userName = "Angad Tendulkar";
    userEmail = "angad@angad.page";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;

      # SSH transport configuration (default to personal)
      core.sshCommand = "ssh -i ~/.ssh/id_ed25519";
      push.autoSetupRemote = true;
    };
  };
}
