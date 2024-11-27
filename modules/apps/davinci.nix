{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.davinci.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable davinci.";
  };

  config = lib.mkIf config.davinci.enable {
    home.packages = with pkgs; [
      davinci-resolve
    ];
  };
}
