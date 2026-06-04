{ lib, ... }:
let
  lua = import ./lua.nix { inherit lib; };

  bezier = a: b: c: d: {
    type = "bezier";
    points = [
      [
        a
        b
      ]
      [
        c
        d
      ]
    ];
  };
in
{
  curve = [
    (lua.args [
      "emphasizedAccel"
      (bezier 0.55 0 0.85 0.55)
    ])
    (lua.args [
      "emphasizedDecel"
      (bezier 0 0.45 0.55 1)
    ])
    (lua.args [
      "standard"
      (bezier 0.2 0 0 0.1)
    ])
  ];
  animation = [
    {
      leaf = "layersIn";
      enabled = true;
      speed = 3;
      bezier = "emphasizedDecel";
    }
    {
      leaf = "layersOut";
      enabled = true;
      speed = 2.5;
      bezier = "emphasizedAccel";
    }
    {
      leaf = "fadeLayers";
      enabled = true;
      speed = 3;
      bezier = "standard";
    }

    {
      leaf = "windowsIn";
      enabled = true;
      speed = 3;
      bezier = "emphasizedDecel";
    }
    {
      leaf = "windowsOut";
      enabled = true;
      speed = 2;
      bezier = "emphasizedAccel";
    }
    {
      leaf = "windowsMove";
      enabled = true;
      speed = 3;
      bezier = "standard";
    }
    {
      leaf = "workspaces";
      enabled = true;
      speed = 3;
      bezier = "standard";
    }

    {
      leaf = "fade";
      enabled = true;
      speed = 3;
      bezier = "standard";
    }
    {
      leaf = "fadeDim";
      enabled = true;
      speed = 3;
      bezier = "standard";
    }
    {
      leaf = "border";
      enabled = true;
      speed = 3;
      bezier = "standard";
    }
    {
      leaf = "border";
      enabled = true;
      speed = 3;
      bezier = "standard";
    }
  ];
}
