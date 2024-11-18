{
  config,
  lib,
  pkgs,
  ...
}: {
  options.discord.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable discord.";
  };

  config = lib.mkIf config.discord.enable {
    home.packages = with pkgs; [
      vesktop
      arrpc
    ];
  };
}
