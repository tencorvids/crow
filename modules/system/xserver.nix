{
  config,
  lib,
  settings,
  ...
}: {
  options.xserver.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable xserver.";
  };

  config = lib.mkIf config.xserver.enable {
    services.xserver = {
      enable = true;
      videoDrivers = lib.mkIf (settings.gpu == "nvidia") ["nvidia"];
    };
  };
}
