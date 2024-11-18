{
  config,
  lib,
  pkgs,
  ...
}: {
  options.steam.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable steam.";
  };

  config = lib.mkIf config.steam.enable {
    home.packages = with pkgs; [
      steam
      gamemode
    ];
  };
}
