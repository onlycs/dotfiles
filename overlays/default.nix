final: prev:
let
  vimPluginsOverlay = import ./vim-plugins.nix final prev;
  toolsOverlay = import ./tools.nix final prev;
  firefoxOverlay = import ./firefox.nix final prev;
in
  vimPluginsOverlay // toolsOverlay // firefoxOverlay
