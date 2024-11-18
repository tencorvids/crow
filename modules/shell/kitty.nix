{
  config,
  lib,
  ...
}: {
  options.kitty.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable kitty.";
  };

  config = lib.mkIf config.kitty.enable {
    programs.kitty = {
      enable = true;

      settings = {
        confirm_os_window_close = 0;
      };
    };
  };
}
