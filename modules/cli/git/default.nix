{
  ...
}:
{
  programs.git = {
    enable = true;

    signing = {
      key = "1C5ADE62BC38DC6EF9347C8143493A9A77837A6E";
      signByDefault = true;
    };

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
