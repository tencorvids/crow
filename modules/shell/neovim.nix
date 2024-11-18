{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options.neovim.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable neovim.";
  };

  config = lib.mkIf config.neovim.enable {
    home.packages = with pkgs; [
      inputs.charon.packages.${system}.default
    ];
  };
}
