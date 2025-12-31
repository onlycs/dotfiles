{ config, pkgs, inputs, lib, ... }:

{
  imports = [ inputs.zen-browser.homeModules.beta ];
  programs.zen-browser.enable = true;

  # Declaratively manage CSS files for Zen Browser
  # This will apply to all Zen Browser profiles
  home.file = {
    ".zen/7s8qq7dj.Default Profile/chrome/userContent.css" = {
      source = ./userContent.css;
      force = true;
    };
    ".zen/7s8qq7dj.Default Profile/chrome/userChrome.css" = {
      source = ./userChrome.css;
      force = true;
    };
  };
}

