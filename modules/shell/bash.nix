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

        	export MANPAGER="nvim +Man!"
      '';

      shellAliases = {
        cat = "bat";

        l = "eza --icons  -a --group-directories-first -1";
        ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
        tree = "eza --icons --tree --group-directories-first";

        vi = "nvim";
        vim = "nvim";
        charon = "cd ~/charon && nvim";
        tome = "cd ~/tome && nvim";

        crow = "cd ~/crow && nvim";
        crow-switch = "git -C ~/crow pull && sudo nixos-rebuild switch --flake ~/crow#${hostname}";
        crow-update = "git -C ~/crow pull && sudo nix flake update --flake ~/crow";
        crow-switch-update = "git -C ~/crow pull && sudo nix flake update --flake ~/crow && sudo nixos-rebuild switch --flake ~/crow#${hostname}";
        crow-switch-full = "git -C ~/crow pull && sudo nix-collect-garbage -d && sudo nix flake update --flake ~/crow && sudo nixos-rebuild switch --flake ~/crow#${hostname}";

        cs = "crow-switch";
        cu = "crow-update";
        csu = "crow-switch-update";
        csf = "crow-switch-full";
      };
    };
  };
}
