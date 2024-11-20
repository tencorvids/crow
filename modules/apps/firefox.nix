{
  config,
  lib,
  ...
}:
{
  options.firefox.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable firefox.";
  };

  config = lib.mkIf config.firefox.enable {
    # home.packages = with pkgs; [
    #   firefox
    # ];

    textfox = {
      enable = true;
      profile = "rew";
      config = { };
    };
  };
}
