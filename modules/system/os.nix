{
  config,
  lib,
  pkgs,
  settings,
  ...
}: {
  options.os.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable os.";
  };

  config = lib.mkIf config.os.enable {
    nix = {
      package = pkgs.nixVersions.stable;
      extraOptions = "experimental-features = nix-command flakes";
      settings = {
        auto-optimise-store = true;
        http-connections = 50;
        warn-dirty = false;
        log-lines = 50;
        sandbox = "relaxed";
        trusted-users = ["${settings.username}"];
      };
      gc = {
        automatic = false;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };

    nixpkgs = {
      config = {
        allowUnfree = true;
      };
    };
  };
}
