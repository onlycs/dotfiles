{ pkgs, ... }:
{
  home.packages = with pkgs; [
    upower
  ];

  programs.caelestia = {
    enable = true;
    package = pkgs.caelestia-shell-with-cli;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      bar.status = {
        showBattery = true;
      };
      appearance = {
        font = {
          family = {
            mono = "JetBrainsMono Nerd Font";
          };
        };
      };
      general = {
        apps = {
          terminal = [ "kitty" ];
          playback = [ "mpv" ];
          explorer = [ "nautilus" ];
        };
      };
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
    };
  };
}
