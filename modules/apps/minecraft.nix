{
  config,
  lib,
  pkgs,
  ...
}: {
  options.minecraft.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable minecraft.";
  };

  config = lib.mkIf config.minecraft.enable {
    home.packages = with pkgs; [
      jdk17
      prismlauncher
    ];
  };
}
