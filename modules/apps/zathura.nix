{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.zathura.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable zathura.";
  };

  config = lib.mkIf config.zathura.enable {
    home.packages = with pkgs; [
      zathura
    ];
  };
}
