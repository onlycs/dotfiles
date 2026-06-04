{ pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Tela-dark";
      package = pkgs.tela-icon-theme;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk4.theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    gtk3.extraConfig.Settings = ''
      gtk-application-prefer-dark-themes=1
    '';
    gtk4.extraConfig.Settings = ''
      gtk-application-prefer-dark-themes=1
    '';

    gtk3.extraCss = ''@import url("noctalia.css");'';
    gtk4.extraCss = ''@import url("noctalia.css");'';
  };
}
