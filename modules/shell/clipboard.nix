{
  config,
  lib,
  pkgs,
  ...
}: {
  options.clipboard.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable clipboard.";
  };

  config = lib.mkIf config.clipboard.enable {
    home.packages = with pkgs; [
      wl-clipboard
      cliphist
    ];
  };
}
