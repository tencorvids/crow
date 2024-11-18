{
  config,
  lib,
  ...
}: {
  options.git.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable git.";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;

      userName = "rew";
      userEmail = "rew@tencorvids.com";

      extraConfig = {
        init.defaultBranch = "main";
        credential.helper = "store";
      };
    };
  };
}
