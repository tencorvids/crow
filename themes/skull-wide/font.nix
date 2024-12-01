{ pkgs }:
{
  serif = {
    name = "Geist";
    # package = pkgs.nerdfonts.override { fonts = [ "GeistMono" ]; };
    package = pkgs.nerd-fonts.geist-mono;
  };

  sansSerif = {
    name = "Geist";
    # package = pkgs.nerdfonts.override { fonts = [ "GeistMono" ]; };
    package = pkgs.nerd-fonts.geist-mono;
  };

  monospace = {
    name = "Geist";
    # package = pkgs.nerdfonts.override { fonts = [ "GeistMono" ]; };
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
