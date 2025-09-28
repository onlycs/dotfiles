{
  # ### Hyprland ###
  # Apps
  terminal = "kitty";
  browser = "zen";
  editor = "zeditor";
  fileExplorer = "nautilus";

  # Touchpad
  touchpadDisableTyping = true;
  touchpadScrollFactor = 0.3;
  workspaceSwipeFingers = 4;
  gestureFingers = 3;
  gestureFingersMore = 4;

  # Blur
  blurEnabled = true;
  blurSpecialWs = false;
  blurPopups = true;
  blurInputMethods = true;
  blurSize = 8;
  blurPasses = 2;
  blurXray = false;

  # Shadow
  shadowEnabled = true;
  shadowRange = 20;
  shadowRenderPower = 3;
  shadowColour = "rgba($surfaced4)";

  # Gaps
  workspaceGaps = 20;
  windowGapsIn = 10;
  windowGapsOut = 40;
  singleWindowGapsOut = 20;

  # Window styling
  windowOpacity = 0.95;
  windowRounding = 10;

  windowBorderSize = 3;
  activeWindowBorderColour = "rgba($primarye6)";
  inactiveWindowBorderColour = "rgba($onSurfaceVariant11)";

  # Misc
  volumeStep = 10;  # In percent
  cursorTheme = "bibata-modern-classic";
  cursorSize = 24;

  # ### Keybinds ###
  # Workspaces
  kbMoveWinToWs = "Super+Alt";
  kbMoveWinToWsGroup = "Ctrl+Super+Alt";
  kbGoToWs = "Super";
  kbGoToWsGroup = "Ctrl+Super";

  kbNextWs = "Super, right";
  kbPrevWs = "Super, left";

  kbToggleSpecialWs = "Super, up";

  # Window actions
  kbMoveWindow = "Super, mouse:272";
  kbResizeWindow = "Super, mouse:273";
  kbPinWindow = "Super, Backslash";
  kbWindowFullscreen = "Super, G";
  kbToggleWindowFloating = "Super, W";
  kbCloseWindow = "Super, Q";

  # Special workspace toggles
  kbSystemMonitor = "Ctrl+Shift, Escape";
  kbMusic = "Super, M";

  # Apps
  kbTerminal = "Super, T";
  kbBrowser = "Super, F";
  kbEditor = "Super, Z";
  kbFileExplorer = "Super, E";

  # Misc
  kbSession = "Ctrl+Alt, Delete";
  kbClearNotifs = "Ctrl+Alt, C";
  kbLock = "Super, L";
  kbRestoreLock = "Super+Alt, L";
}
