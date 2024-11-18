{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.javascript.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable javascript.";
  };

  config = lib.mkIf config.javascript.enable {
    home.packages = with pkgs; [
      deno
      tailwindcss-language-server
    ];
  };
}
