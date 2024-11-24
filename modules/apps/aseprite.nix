{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.aseprite.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable aseprite.";
  };

  config = lib.mkIf config.aseprite.enable {
    home.packages = with pkgs; [
      aseprite
    ];
  };
}
