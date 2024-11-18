{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  options.spotify.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Spotify.";
  };

  config = lib.mkIf config.spotify.enable {
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "spotify"
      ];

    programs.spicetify = {
      enable = true;
      enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
        hidePodcasts
        fullAppDisplay
        shuffle
        keyboardShortcut
      ];
      theme = lib.mkForce inputs.spicetify-nix.legacyPackages.${pkgs.system}.themes.lucid;
    };
  };
}
