{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.manga.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable manga.";
  };

  config = lib.mkIf config.manga.enable {
    home.packages = with pkgs; [
      mangal
      hakuneko
    ];
  };
}
