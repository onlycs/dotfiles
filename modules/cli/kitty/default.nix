{ ... }:
let
  material3 = {
    type = "dark";
    primary_paletteKeyColor = "#44835d";
    secondary_paletteKeyColor = "#677c6c";
    tertiary_paletteKeyColor = "#547d8a";
    neutral_paletteKeyColor = "#737872";
    neutral_variant_paletteKeyColor = "#717971";
    background = "#0f1511";
    onBackground = "#dfe4dd";
    surface = "#0f1511";
    surfaceDim = "#0f1511";
    surfaceBright = "#353b36";
    surfaceContainerLowest = "#0a0f0c";
    surfaceContainerLow = "#181d19";
    surfaceContainer = "#1c211d";
    surfaceContainerHigh = "#262b27";
    surfaceContainerHighest = "#313631";
    onSurface = "#dfe4dd";
    surfaceVariant = "#414942";
    onSurfaceVariant = "#c0c9c0";
    inverseSurface = "#dfe4dd";
    inverseOnSurface = "#2c322d";
    outline = "#8a938b";
    outlineVariant = "#414942";
    shadow = "#000000";
    scrim = "#000000";
    surfaceTint = "#94d5a9";
    primary = "#94d5a9";
    onPrimary = "#00391f";
    primaryContainer = "#0c5130";
    onPrimaryContainer = "#aff2c4";
    inversePrimary = "#2b6a46";
    secondary = "#b5ccba";
    onSecondary = "#213528";
    secondaryContainer = "#3a4e3f";
    onSecondaryContainer = "#d1e8d5";
    tertiary = "#a3cddb";
    onTertiary = "#033641";
    tertiaryContainer = "#6e97a4";
    onTertiaryContainer = "#000000";
    error = "#ffb4ab";
    onError = "#690005";
    errorContainer = "#93000a";
    onErrorContainer = "#ffdad6";
    primaryFixed = "#aff2c4";
    primaryFixedDim = "#94d5a9";
    onPrimaryFixed = "#002110";
    onPrimaryFixedVariant = "#0c5130";
    secondaryFixed = "#d1e8d5";
    secondaryFixedDim = "#b5ccba";
    onSecondaryFixed = "#0c1f14";
    onSecondaryFixedVariant = "#374b3d";
    tertiaryFixed = "#bfe9f8";
    tertiaryFixedDim = "#a3cddb";
    onTertiaryFixed = "#001f27";
    onTertiaryFixedVariant = "#214c58";
    term0 = "#343433";
    term1 = "#769e00";
    term2 = "#89df90";
    term3 = "#b0f89e";
    term4 = "#7eb69b";
    term5 = "#c6a844";
    term6 = "#97d8a9";
    term7 = "#d2dbca";
    term8 = "#9ea598";
    term9 = "#85b900";
    term10 = "#8cf498";
    term11 = "#d8ffcb";
    term12 = "#a9c8b3";
    term13 = "#cec06b";
    term14 = "#a3ecb4";
    term15 = "#ffffff";
    rosewater = "#f1f3e5";
    flamingo = "#e3e4c5";
    pink = "#bae2ff";
    mauve = "#5bd0df";
    red = "#c5b542";
    maroon = "#c6c177";
    peach = "#b6d89d";
    yellow = "#def9d5";
    green = "#a5f1ba";
    teal = "#abeec9";
    sky = "#9eebc9";
    sapphire = "#7cd8b9";
    blue = "#60cfb7";
    lavender = "#87dccb";
    klink = "#06997d";
    klinkSelection = "#04997d";
    kvisited = "#008ca9";
    kvisitedSelection = "#008ca9";
    knegative = "#838f00";
    knegativeSelection = "#838f00";
    kneutral = "#6dbe37";
    kneutralSelection = "#6cbe37";
    kpositive = "#2fc076";
    kpositiveSelection = "#2ec077";
    text = "#dfe4dd";
    subtext1 = "#c0c9c0";
    subtext0 = "#8a938b";
    overlay2 = "#788079";
    overlay1 = "#656d66";
    overlay0 = "#545b55";
    surface2 = "#434a45";
    surface1 = "#323934";
    surface0 = "#212722";
    base = "#0f1511";
    mantle = "#0f1511";
    crust = "#0e1410";
    success = "#B5CCBA";
    onSuccess = "#213528";
    successContainer = "#374B3E";
    onSuccessContainer = "#D1E9D6";
  };
in
{
  programs.kitty = {
    enable = true;
    keybindings = {
      "kitty_mod+alt+k" = "scroll_line_up";
      "kitty_mod+alt+j" = "scroll_line_down";
      "ctrl+backspace" = "close_window";
      "kitty_mod+l" = "next_window";
      "kitty_mod+h" = "previous_window";
      "kitty_mod+alt+l" = "move_window_forward";
      "kitty_mod+alt+h" = "move_window_backward";
      "kitty_mod+k" = "next_tab";
      "kitty_mod+j" = "previous_tab";
      "kitty_mod+t" = "new_tab_with_cwd";
      "kitty_mod+x" = "close_tab";
      "kitty_mod+d" = "detach_tab";
      "kitty_mod+alt+d" = "detach_window ask";
      "alt+shift+r" = "set_tab_title";
    };
    settings = {
      shell = "nu";
      font_family = "JetBrainsMono Nerd Font";
      font_size = 11;
      enable_audio_bell = true;

      # Material you based on my wallpaper

      # Material You 3 cyan/teal theme
      background = material3.background;
      background_opacity = "0.75";
      background_blur = 48;

      cursor = material3.primary;
      foreground = material3.onBackground;
      url_color = material3.tertiary;

      selection_background = material3.primaryContainer;
      selection_foreground = material3.onPrimaryContainer;

      cursor_text_color = material3.onPrimary;
      cursor_trail = 3;

      # Tabs
      active_tab_background = material3.primaryContainer;
      active_tab_foreground = material3.onPrimaryContainer;
      inactive_tab_background = material3.inverseOnSurface;
      inactive_tab_foreground = material3.outline;

      # Terminal Colors
      # Black
      color0 = material3.term0;
      color8 = material3.term8;

      # Red
      color1 = material3.term1;
      color9 = material3.term9;

      # Green
      color2 = material3.term2;
      color10 = material3.term10;

      # Yellow
      color3 = material3.term3;
      color11 = material3.term11;

      # Blue
      color4 = material3.term4;
      color12 = material3.term12;

      # Magenta
      color5 = material3.term5;
      color13 = material3.term13;

      # Cyan
      color6 = material3.term6;
      color14 = material3.term14;

      # White
      color7 = material3.term7;
      color15 = material3.term15;

      # Mouse
      open_url_with = "default";
      copy_on_select = "yes";

      # Tab bar
      tab_bar_style = "powerline";
      tab_bar_align = "left";
      tab_bar_min_tabs = 2;
      tab_powerline_style = "round";

      # Window
      window_padding_width = "20";
    };
  };
}
