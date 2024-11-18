{
  config,
  lib,
  pkgs,
  ...
}: {
  options.fd.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable fd.";
  };

  config = lib.mkIf config.fd.enable {
    home.packages = with pkgs; [
      fd
    ];
  };
}
