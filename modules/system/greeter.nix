{
  config,
  lib,
  pkgs,
  ...
}: {
  options.greeter.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable greeter.";
  };

  config = lib.mkIf config.greeter.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "greeter";
        };
      };
    };
  };
}
