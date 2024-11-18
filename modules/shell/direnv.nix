{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.direnv.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable direnv.";
  };

  config = lib.mkIf config.direnv.enable {
    home.packages = with pkgs; [
      direnv
    ];

    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
