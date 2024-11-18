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
      '';

      shellAliases = {
        cat = "bat";

        l = "eza --icons  -a --group-directories-first -1";
        ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
        tree = "eza --icons --tree --group-directories-first";

        vi = "nvim";
        vim = "nvim";
        cdvim = "cd ~/charon && nvim";

        cdnix = "cd ~/crow && nvim";
        nix-switch = "sudo nixos-rebuild switch --flake ~/_#${hostname}";
        nix-switch-update = "sudo nixos-rebuild switch --upgrade --flake ~/_#${hostname}";
      };
    };
  };
}
