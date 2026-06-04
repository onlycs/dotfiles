{ ... }:
let
  cfg = builtins.fromJSON (builtins.readFile ./config.json);
  plug = {
    enabled = true;
    sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
  };

  toPlugs =
    names:
    builtins.listToAttrs (
      map (name: {
        name = name;
        value = plug;
      }) names
    );

  ids = [
    "desktop-calendar"
    "currency-exchange"
    "file-search"
    "network-manager-vpn"
    "noctalia-calculator"
    "parallax-wallpaper"
    "privacy-indicator"
    "screen-recorder"
    "screenshot"
    "todo"
    "usb-drive-manager"
  ];
in
{
  programs.noctalia-shell = {
    enable = true;
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = toPlugs ids;
      version = 2;
    };
    settings = cfg;
  };
}
