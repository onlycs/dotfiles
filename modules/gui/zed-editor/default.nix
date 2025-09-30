{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    zed-editor
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
    };
  };
}
