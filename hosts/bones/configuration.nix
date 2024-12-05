{
  inputs,
  settings,
  hostname,
  ...
}:
{
  ### Imports ###
  imports = [
    ./hardware-configuration.nix
    "${inputs.self}/modules/system"
    inputs.home-manager.nixosModules.home-manager
  ];

  ### System Configurations ###
  system.stateVersion = settings.stateVersion;

  ### Core Services ###
  bluetooth.enable = true;
  boot.enable = true;
  greeter.enable = true;
  hardware.enable = true;
  input.enable = true;
  locale.enable = true;
  network.enable = true;
  os.enable = true;
  security.enable = true;
  ssh.enable = true;
  time.enable = true;
  user.enable = true;
  xdg.enable = true;
  xserver.enable = true;

  ### Home Manager ###
  home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    extraSpecialArgs = {
      settings = settings;
      inputs = inputs;
      hostname = hostname;
    };

    users.${settings.username} = {
      home.stateVersion = settings.stateVersion;
      home.username = settings.username;
      home.homeDirectory = settings.homeDir;

      ### User Module Imports ###
      imports = [
        inputs.textfox.homeManagerModules.default
        inputs.spicetify-nix.homeManagerModules.default
        "${inputs.self}/modules/apps"
        "${inputs.self}/modules/shell"
        "${inputs.self}/modules/wm"
      ];

      ### User Applications ###
      aseprite.enable = true;
      bitwig.enable = false;
      davinci.enable = false;
      discord.enable = true;
      firefox.enable = true;
      gimp.enable = true;
      godot.enable = true;
      inkscape.enable = true;
      mime.enable = true;
      minecraft.enable = true;
      nemo.enable = true;
      obsidian.enable = true;
      spotify.enable = true;
      steam.enable = true;
      vlc.enable = true;
      zathura.enable = true;

      ### Shell Tools ###
      bash.enable = true;
      bat.enable = true;
      btop.enable = true;
      clipboard.enable = true;
      direnv.enable = true;
      eza.enable = true;
      fd.enable = true;
      fzf.enable = true;
      git.enable = true;
      jq.enable = true;
      kitty.enable = true;
      lazygit.enable = true;
      manga.enable = true;
      neovim.enable = true;
      ripgrep.enable = true;
      starship.enable = true;
      tldr.enable = true;
      tmux.enable = true;
      yazi.enable = true;

      ### Window Manager ###
      fuzzel.enable = true;
      hyprland.enable = true;
      stylix.enable = true;
      waybar.enable = true;
    };
  };
}
