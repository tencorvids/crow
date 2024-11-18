{
  config,
  lib,
  settings,
  ...
}: {
  options.time.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable time.";
  };

  config = lib.mkIf config.time.enable {
    time.timeZone = settings.timezone;
  };
}
