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
  nvidia.enable = true;
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
        "${inputs.self}/modules/dev"
        "${inputs.self}/modules/shell"
        "${inputs.self}/modules/wm"
      ];

      ### User Applications ###
      discord.enable = true;
      firefox.enable = true;
      minecraft.enable = true;
      spotify.enable = true;
      steam.enable = true;

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
      neovim.enable = true;
      ripgrep.enable = true;
      starship.enable = true;
      tmux.enable = true;

      ### Window Manager ###
      fuzzel.enable = true;
      hyprland.enable = true;
      stylix.enable = true;
      waybar.enable = true;

      ### Development Languages ###
      # go.enable = true;
      # javascript.enable = true;
    };
  };
}