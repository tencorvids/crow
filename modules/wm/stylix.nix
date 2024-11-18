{
  config,
  lib,
  pkgs,
  inputs,
  settings,
  ...
}: {
  imports = [inputs.stylix.homeManagerModules.stylix];

  config = lib.mkIf config.stylix.enable {
    home.packages = with pkgs; [
      dconf
    ];
    dconf.enable = true;

    stylix = {
      autoEnable = true;
      image = "${builtins.path {path = ./../../themes/${settings.theme}/wallpaper.png;}}";
      base16Scheme = "${builtins.path {path = ./../../themes/${settings.theme}/${settings.theme}.yaml;}}";
      fonts = import ./../../themes/${settings.theme}/font.nix {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      };
      cursor = import ./../../themes/${settings.theme}/cursor.nix {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
      };
    };
  };
}
