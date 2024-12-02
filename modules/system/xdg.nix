{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.xdg.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable xdg.";
  };

  config = lib.mkIf config.xdg.enable {
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];
    };
  };
}
