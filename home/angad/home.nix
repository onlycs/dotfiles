{
  config,
  pkgs,
  inputs,
  lib,
  osConfig,
  ...
}:
let
  hostname = osConfig.networking.hostName or "unknown";
in
{
  home.username = "angad";
  home.homeDirectory = "/home/angad";

  imports = [
    inputs.caelestia-shell.homeManagerModules.default
    ../../modules/cli/cli-tools
    ../../modules/cli/git
    ../../modules/cli/ssh
    ../../modules/cli/nushell
    ../../modules/cli/neovim
    ../../modules/wm/hyprland/home.nix
    ../../modules/wm/caelestia/home.nix
    ../../modules/cli/kitty
    ../../modules/gui/apps
    ../../modules/gui/zed-editor
    ../../modules/gui/zen-browser
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

  gtk = {
    enable = true;
    iconTheme = {
      name = "Tela-dark";
      package = pkgs.tela-icon-theme;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };

  home.stateVersion = "25.05";
}
