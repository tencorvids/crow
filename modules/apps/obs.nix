{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.obs.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable obs.";
  };

  config = lib.mkIf config.obs.enable {
    home.packages = with pkgs; [
      obs-studio
    ];
  };
}
