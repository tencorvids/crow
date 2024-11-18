{
  config,
  lib,
  pkgs,
  ...
}: {
  options.btop.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable the btop system monitoring tool.";
  };

  config = lib.mkIf config.btop.enable {
    home.packages = with pkgs; [
      btop
    ];
  };
}
