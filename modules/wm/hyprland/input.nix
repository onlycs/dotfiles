{
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
      disable_while_typing = true;
      scroll_factor = 0.3;
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
