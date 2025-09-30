{
  config,
  pkgs,
  lib,
  ...
}:
let
  material3 = {

    type = "dark";
    primary = "#7dda9b";
    onPrimary = "#00391c";
    primaryContainer = "#00522b";
    onPrimaryContainer = "#98f7b5";
    secondary = "#b6ccb9";
    onSecondary = "#223527";
    secondaryContainer = "#384b3c";
    onSecondaryContainer = "#d2e8d4";
    tertiary = "#a2ceda";
    onTertiary = "#023640";
    tertiaryContainer = "#214c57";
    onTertiaryContainer = "#beeaf6";
    error = "#ffb4ab";
    onError = "#690005";
    errorContainer = "#93000a";
    onErrorContainer = "#ffdad6";
    background = "#191c19";
    onBackground = "#e1e3de";
    surface = "#191c19";
    onSurface = "#e1e3de";
    surfaceVariant = "#414942";
    onSurfaceVariant = "#c0c9bf";
    outline = "#8b938a";
    outlineVariant = "#414942";
    shadow = "#000000";
    scrim = "#000000";
    inverseSurface = "#e1e3de";
    inverseOnSurface = "#2e312e";
    inversePrimary = "#006d3b";
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
      color0 = material3.surface;
      color8 = material3.surfaceVariant;

      # Red
      color1 = material3.error;
      color9 = material3.onErrorContainer;

      # Green
      color2 = material3.primary;
      color10 = material3.onPrimaryContainer;

      # Yellow
      color3 = "#A7A711";
      color11 = "#E8E822";

      # Blue
      color4 = "#2C36B3";
      color12 = "#0891b2";

      # Magenta
      color5 = "#d8709a";
      color13 = "#c084fc";

      # Cyan
      color6 = material3.tertiary;
      color14 = material3.onTertiaryContainer;

      # White
      color7 = material3.onBackground;
      color15 = material3.inverseOnSurface;

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
