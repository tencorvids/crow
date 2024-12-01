{ pkgs }:
{
  serif = {
    name = "JetBrainsMono";
    package = pkgs.nerd-fonts.jetbrains-mono;
  };

  sansSerif = {
    name = "JetBrainsMono";
    package = pkgs.nerd-fonts.jetbrains-mono;
  };

  monospace = {
    name = "JetBrainsMono";
    package = pkgs.nerd-fonts.jetbrains-mono;
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
