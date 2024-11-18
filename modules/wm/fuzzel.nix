{
  config,
  lib,
  ...
}: {
  options.fuzzel.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable fuzzel.";
  };

  config = lib.mkIf config.fuzzel.enable {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          line-height = 25;
          fields = "name,generic,comment,categories,filename,keywords";
          terminal = "kitty";
          prompt = "' >  '";
          layer = "top";
          lines = 10;
          width = 35;
          horizontal-pad = 25;
          inner-pad = 5;
        };
        border = {
          radius = 0;
          width = 4;
        };
      };
    };
  };
}
