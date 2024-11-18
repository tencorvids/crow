{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.bat.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable bat.";
  };

  config = lib.mkIf config.bat.enable {
    home.packages = with pkgs; [
      bat
    ];
  };
}
