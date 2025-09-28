let
  variables = import ./variables.nix;
in {
  rounding = variables.windowRounding;

  blur = {
    enabled = true;
    xray = false;
    special = false;
    ignore_opacity = true;
    new_optimizations = true;
    popups = true;
    input_methods = true;
    size = variables.blurSize;
    passes = variables.blurPasses;
  };

  shadow = {
    enabled = true;
    range = variables.shadowRange;
    render_power = variables.shadowRenderPower;
    color = variables.shadowColour;
  };
}
