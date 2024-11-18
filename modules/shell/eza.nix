{
  config,
  lib,
  pkgs,
  ...
}: {
  options.eza.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable eza.";
  };

  config = lib.mkIf config.eza.enable {
    home.packages = with pkgs; [
      eza
    ];
  };
}
