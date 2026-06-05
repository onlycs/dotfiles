{
  pkgs,
  inputs,
  ...
}:
{
  home.username = "angad";
  home.homeDirectory = "/home/angad";

  imports = [
    inputs.noctalia.homeModules.default
    ../../modules/cli/cli-tools
    ../../modules/cli/git
    ../../modules/cli/ssh
    ../../modules/cli/nushell
    ../../modules/wm/hyprland/home.nix
    ../../modules/wm/noctalia/home.nix
    ../../modules/cli/kitty
    ../../modules/gui/apps
    ../../modules/gui/zed-editor
    ../../modules/gui/zen-browser
    ../../modules/gui/gtk
    ../../modules/wm/easyeffects/home.nix
  ];

  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    nix-direnv.enable = true;
  };

  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles";
  };

  # Host-specific environment variables
  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.packages = with pkgs; [ gcr ];

  services.gpg-agent = {
    enable = true;
  };

  home.stateVersion = "26.05";
}
