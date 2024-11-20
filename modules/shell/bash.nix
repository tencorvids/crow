{
  config,
  lib,
  hostname,
  ...
}:
{
  options.bash.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable bash.";
  };

  config = lib.mkIf config.bash.enable {
    programs.bash = {
      enable = true;
      enableCompletion = true;

      initExtra = ''
        eval "$(starship init bash)"
        eval "$(direnv hook bash)"

        if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
          tmux a -t main || exec tmux new -s main
        fi
      '';

      shellAliases = {
        cat = "bat";

        l = "eza --icons  -a --group-directories-first -1";
        ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
        tree = "eza --icons --tree --group-directories-first";

        vi = "nvim";
        vim = "nvim";
        charon = "cd ~/charon && nvim";

        crow = "cd ~/crow && nvim";
        crow-switch = "git -C ~/crow pull && sudo nixos-rebuild switch --flake ~/crow#${hostname}";
        crow-update = "git -C ~/crow pull && sudo nix flake update --flake ~/crow#${hostname}";
        crow-switch-update = "git -C ~/crow pull && sudo nixos-rebuild switch --upgrade --flake ~/crow#${hostname}";
        crow-switch-full = "git -C ~/crow pull && sudo nix-collect-garbage -d && sudo nixos-rebuild switch --flake ~/crow#${hostname}";
      };
    };
  };
}
