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

      shortcut = "a";

      extraConfig = ''
        # Default termtype. If the rcfile sets $TERM, that overrides this value.
        set -g default-terminal screen-256color

        # Scrollback size
        set -g history-limit 10000

        # Set first window to index 1 (not 0) to map more to the keyboard layout
        set -g base-index 1
        setw -g pane-base-index 1

        # Pass through xterm keys
        set -g xterm-keys on

        # Enable mouse scrolling shell output
        set -g mouse on
      '';
    };
  };
}
