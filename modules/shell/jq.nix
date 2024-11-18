{
  config,
  lib,
  pkgs,
  ...
}: {
  options.jq.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable jq.";
  };

  config = lib.mkIf config.jq.enable {
    home.packages = with pkgs; [
      jq
    ];
  };
}
