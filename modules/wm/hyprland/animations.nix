{
  enabled = true;
  bezier = [
    "emphasizedAccel, 0.55, 0, 0.85, 0.55"
    "emphasizedDecel, 0, 0.45, 0.55, 1"
    "standard, 0.2, 0, 0, 1"
  ];
  animation = [
    "layersIn, 1, 3, emphasizedDecel, slide"
    "layersOut, 1, 2.5, emphasizedAccel, slide"
    "fadeLayers, 1, 3, standard"

    "windowsIn, 1, 3, emphasizedDecel"
    "windowsOut, 1, 2, emphasizedAccel"
    "windowsMove, 1, 3, standard"
    "workspaces, 1, 3, standard"

    "fade, 1, 3, standard"
    "fadeDim, 1, 3, standard"
    "border, 1, 3, standard"
  ];
}
