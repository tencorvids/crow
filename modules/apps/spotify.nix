{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:
{
  options.spotify.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Spotify.";
  };

  config = lib.mkIf config.spotify.enable {
    home.packages = with pkgs; [
      spotify-player
    ];

    programs.spotify-player = {
      enable = true;

      settings = {
        client_id = "5ee98402c4c44b3d9bea27f99a1c5e44";
      };
    };

    nixpkgs.config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "spotify"
      ];

    programs.spicetify = {
      enable = true;
      enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
        hidePodcasts
        fullAppDisplay
        shuffle
      ];
      theme = lib.mkForce inputs.spicetify-nix.legacyPackages.${pkgs.system}.themes.text;
    };

  };
}
