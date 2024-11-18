{
  config,
  lib,
  pkgs,
  ...
}: {
  options.go.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable go.";
  };

  config = lib.mkIf config.go.enable {
    home.packages = with pkgs; [
      go
    ];
  };
}
