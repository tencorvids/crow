{
  config,
  lib,
  pkgs,
  settings,
  ...
}: {
  options.user.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable user.";
  };

  config = lib.mkIf config.user.enable {
    users.users.${settings.username} = {
      isNormalUser = true;
      description = settings.username;
      initialPassword = settings.username;
      shell = pkgs.bash;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };
}
