{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.godot.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable godot.";
  };

  config = lib.mkIf config.godot.enable {
    home.packages = with pkgs; [
      godot_4
    ];
  };
}
