{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    lato
    raleway
    lexend
    helvetica-neue-lt-std
  ];

  programs.neovim.enable = true;
  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
