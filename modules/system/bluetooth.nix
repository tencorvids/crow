{
  config,
  lib,
  ...
}: {
  options.bluetooth.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable bluetooth.";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth.enable = true;
  };
}
