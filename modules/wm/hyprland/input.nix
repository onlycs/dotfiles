let
  variables = import ./variables.nix;
in {
  input = {
    kb_layout = "us";
    numlock_by_default = false;
    repeat_delay = 250;
    repeat_rate = 35;

    focus_on_close = 1;

    touchpad = {
      natural_scroll = true;
      disable_while_typing = variables.touchpadDisableTyping;
      scroll_factor = variables.touchpadScrollFactor;
      clickfinger_behavior = true;
    };
  };

  binds = {
    scroll_event_delay = 0;
  };

  cursor = {
    hotspot_padding = 1;
  };
}
