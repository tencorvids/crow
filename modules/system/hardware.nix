{
  config,
  lib,
  ...
}: {
  options.hardware.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable hardware.";
  };

  config = lib.mkIf config.hardware.enable {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      enableRedistributableFirmware = true;
    };
  };
}
