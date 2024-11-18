{
  config,
  lib,
  ...
}: {
  options.ssh.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable ssh.";
  };

  config = lib.mkIf config.ssh.enable {
    services = {
      openssh = {
        enable = true;
        settings.PermitRootLogin = "yes";
      };
    };
  };
}
