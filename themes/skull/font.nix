{ pkgs }:
{
  serif = {
    name = "GeistMono";
    package = pkgs.nerd-fonts.geist-mono;
  };

  sansSerif = {
    name = "GeistMono";
    package = pkgs.nerd-fonts.geist-mono;
  };

  monospace = {
    name = "GeistMono";
    package = pkgs.nerd-fonts.geist-mono;
  };

  emoji = {
    name = "Noto Emoji Color";
    package = pkgs.noto-fonts-emoji;
  };

  sizes = {
    terminal = 12;
    applications = 12;
    popups = 12;
    desktop = 12;
  };
}
