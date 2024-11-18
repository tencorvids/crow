{
  config,
  lib,
  pkgs,
  ...
}: {
  options.fzf.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable fzf.";
  };

  config = lib.mkIf config.fzf.enable {
    home.packages = with pkgs; [
      fzf
    ];
  };
}
