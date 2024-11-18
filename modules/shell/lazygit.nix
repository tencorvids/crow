{
  config,
  lib,
  pkgs,
  ...
}: {
  options.lazygit.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable lazygit.";
  };

  config = lib.mkIf config.lazygit.enable {
    home.packages = with pkgs; [
      lazygit
    ];
  };
}
