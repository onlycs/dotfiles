let
  variables = import ./variables.nix;
in {
  #col.border_active = variables.activeWindowBorderColour;
  #col.border_inactive = variables.inactiveWindowBorderColour;
  #col.border_locked_active = variables.activeWindowBorderColour;
  #col.border_locked_inactive = variables.inactiveWindowBorderColour;

  groupbar = {
    font_family = "JetBrainsMono Nerd Font";
    font_size = 15;
    gradients = true;
    gradient_round_only_edges = false;
    gradient_rounding = 5;
    height = 25;
    indicator_height = 0;
    gaps_in = 3;
    gaps_out = 3;
    text_color = "rgb($onPrimary)";
    #col.active = "rgba($primaryd4)";
    #col.inactive = "rgba($outlined4)";
    #col.locked_active = "rgba($primaryd4)";
    #col.locked_inactive = "rgba($secondaryd4)";
  };
}
