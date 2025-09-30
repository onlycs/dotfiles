{ pkgs, ... }: {
  home.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  programs.neovim.enable = true;
  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
