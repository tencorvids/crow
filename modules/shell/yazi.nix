{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.yazi.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable yazi.";
  };

  config = lib.mkIf config.yazi.enable {
    home.packages = with pkgs; [
      yazi
    ];
  };
}
