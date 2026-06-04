{ lib }:
{
  args = n: { _args = n; };
  inline = lib.generators.mkLuaInline;
}
