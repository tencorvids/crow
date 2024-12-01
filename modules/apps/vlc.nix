{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.vlc.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable vlc.";
  };

  config = lib.mkIf config.vlc.enable {
    home.packages = with pkgs; [
      vlc
    ];
  };
}
