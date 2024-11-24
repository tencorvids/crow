{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.inkscape.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable inkscape.";
  };

  config = lib.mkIf config.inkscape.enable {
    home.packages = with pkgs; [
      inkscape
    ];
  };
}
