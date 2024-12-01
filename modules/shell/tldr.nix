{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.tldr.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable tldr.";
  };

  config = lib.mkIf config.tldr.enable {
    home.packages = with pkgs; [
      tealdeer
    ];
  };
}
