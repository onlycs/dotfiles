{ pkgs, ... }: {
  services.easyeffects = {
    enable = true;
    package = pkgs.easyeffects;
  };
}
