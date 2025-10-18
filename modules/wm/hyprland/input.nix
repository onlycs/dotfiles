let variables = import ./variables.nix;
in {
  input = {
    kb_layout = "us";
    numlock_by_default = false;
    repeat_delay = 250;
    repeat_rate = 35;

    focus_on_close = 1;
    sensitivity = -0.25;
    accel_profile = "flat";

    touchpad = {
      natural_scroll = true;
      disable_while_typing = variables.touchpadDisableTyping;
      scroll_factor = variables.touchpadScrollFactor;
      clickfinger_behavior = true;
    };
  };

  device = {
    name = "type:touchpad";
    sensitivity = 0.25;
  };

  binds = { scroll_event_delay = 0; };

  cursor = { hotspot_padding = 1; };
}
