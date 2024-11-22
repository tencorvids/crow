{pkgs}: {
  serif = {
    name = "Geist";
    package = pkgs.nerdfonts.override {fonts = ["GeistMono"];};
  };

  sansSerif = {
    name = "Geist";
    package = pkgs.nerdfonts.override {fonts = ["GeistMono"];};
  };

  monospace = {
    name = "Geist";
    package = pkgs.nerdfonts.override {fonts = ["GeistMono"];};
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
