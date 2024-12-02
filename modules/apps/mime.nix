{
  config,
  lib,
  ...
}:
{
  options.mime.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable mime.";
  };

  config = lib.mkIf config.mime.enable {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      };
    };
  };
}
