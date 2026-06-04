{ pkgs, ... }:

{
  home.packages = with pkgs; [
    zed-editor
    nerd-fonts.jetbrains-mono
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
    ];

    userSettings = {
      ui_font_size = 14;
      buffer_font_size = 14;
      buffer_font_family = "JetBrainsMono Nerd Font";

      load_direnv = "shell_hook";
      format_on_save = "on";

      lsp = {
        rust-analyzer.binary.path_lookup = true;
        nix.binary.path_lookup = true;
      };

      theme = {
        mode = "system";
        dark = "JetBrains Dark";
        light = "JetBrains Light";
      };
    };
  };
}
