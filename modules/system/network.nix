{
  config,
  lib,
  pkgs,
  hostname,
  ...
}: {
  options.network.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable network.";
  };

  config = lib.mkIf config.network.enable {
    networking = {
      hostName = hostname;
      networkmanager.enable = true;
      nameservers = ["1.1.1.1"];
      firewall = {
        enable = true;
        allowedTCPPorts = [22 80 443];
        allowedUDPPorts = [];
      };
    };

    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];
  };
}
