{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.obsidian.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable obsidian.";
  };

  config = lib.mkIf config.obsidian.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
