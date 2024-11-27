{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.bitwig.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable bitwig.";
  };

  config = lib.mkIf config.bitwig.enable {
    home.packages = with pkgs; [
      bitwig-studio
    ];
  };
}
