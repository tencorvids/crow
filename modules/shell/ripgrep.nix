{
  config,
  lib,
  pkgs,
  ...
}: {
  options.ripgrep.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable ripgrep.";
  };

  config = lib.mkIf config.ripgrep.enable {
    home.packages = with pkgs; [
      ripgrep
    ];
  };
}
