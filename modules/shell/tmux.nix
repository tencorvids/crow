{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.tmux.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable tmux.";
  };

  config = lib.mkIf config.tmux.enable {
    home.packages = with pkgs; [
      tmux
    ];

    programs.tmux = {
      enable = true;

      # Set the prefix key to Ctrl+a
      prefix = "C-a";

      # Additional configuration
      extraConfig = ''
        # Send prefix using the new key
        bind C-a send-prefix
      '';
    };
  };
}
