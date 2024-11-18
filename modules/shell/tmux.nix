{
  config,
  lib,
  pkgs,
  ...
}: {
  options.tmux.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable tmux.";
  };

  config = lib.mkIf config.tmux.enable {
    home.packages = with pkgs; [
      tmux
    ];
  };
}
