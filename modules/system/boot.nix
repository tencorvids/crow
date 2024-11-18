{
  config,
  lib,
  pkgs,
  settings,
  ...
}: {
  options.boot.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable boot.";
  };

  config = lib.mkIf config.boot.enable {
    boot = {
      kernelModules = lib.optionals (settings.cpu == "intel") ["kvm-intel"];
      kernelParams =
        [
          "quiet"
          "systemd.show_status=auto"
          "rd.udev.log_level=3"
        ]
        ++ lib.optionals (settings.gpu == "nvidia") [
          "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
        ];
      supportedFilesystems = ["ext4" "btrfs"];
      consoleLogLevel = 3;

      kernelPackages = pkgs.linuxPackages_latest;

      loader = {
        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
        grub = {
          enable = true;
          devices = ["nodev"];
          efiSupport = true;
          useOSProber = true;
        };
        systemd-boot.enable = lib.mkForce false;
      };
    };
  };
}
