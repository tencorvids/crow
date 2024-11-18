{
  config,
  lib,
  ...
}: {
  options.security.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable security.";
  };

  config = lib.mkIf config.security.enable {
    security = {
      sudo.wheelNeedsPassword = false;
    };
  };
}
