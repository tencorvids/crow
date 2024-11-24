{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.gimp.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable gimp.";
  };

  config = lib.mkIf config.gimp.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
