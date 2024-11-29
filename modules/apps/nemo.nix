{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.nemo.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable nemo.";
  };

  config = lib.mkIf config.nemo.enable {
    home.packages = with pkgs; [
      nemo
    ];
  };
}
