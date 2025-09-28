{
  config,
  pkgs,
  inputs,
  lib,
  osConfig,
  ...
}: let
  hostname = osConfig.networking.hostName or "unknown";
in {
  home.username = "angad";
  home.homeDirectory = "/home/angad";

  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ../../modules/tui/cli-tools
    ../../modules/tui/git
    ../../modules/tui/ssh
    ../../modules/tui/nushell
    ../../modules/wm/hyprland/home.nix
    ../../modules/wm/caelestia/home.nix
    ../../modules/tui/nvim
    ../../modules/tui/kitty
    ../../modules/gui/apps
    ../../modules/gui/zen-browser
  ];

  home.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/.dotfiles";
  };

  # Host-specific environment variables
  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.stateVersion = "25.05";
}
