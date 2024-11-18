{
  config,
  lib,
  ...
}: {
  options.input.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable input.";
  };

  config = lib.mkIf config.input.enable {
    services.libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
      touchpad = {
        accelProfile = "flat";
      };
    };
  };
}
