{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.nvidia.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable nvidia.";
  };

  config = lib.mkIf config.nvidia.enable {
    hardware = {
      nvidia = {
        open = true;
        nvidiaSettings = true;
        powerManagement.enable = true;
        modesetting.enable = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [ nvidia-vaapi-driver ];
      };
    };
    environment = {
      variables = {
        LIBVA_DRIVER_NAME = "nvidia";
        XDG_SESSION_TYPE = "wayland";
        GBM_BACKEND = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        __GL_GSYNC_ALLOWED = "0";
        __GL_VRR_ALLOWED = "0";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        CUDA_CACHE_PATH = "$XDG_CACHE_HOME/nv";
      };
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };

    };
  };
}
