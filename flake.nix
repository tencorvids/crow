{
  description = "Rew's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    charon.url = "github:tencorvids/charon";
    stylix.url = "github:danth/stylix";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    charon,
    stylix,
    spicetify-nix,
    ...
  }: let
    getHosts = dir: let
      entries = builtins.readDir dir;
    in
      builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

    hosts = getHosts ./hosts;
  in {
    nixosConfigurations = builtins.listToAttrs (map (hostname: let
        hostDir = ./hosts/${hostname};
        settings = import "${hostDir}/settings.nix";
        system = settings.system;
      in {
        name = hostname;
        value = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/${hostname}/configuration.nix
          ];
          specialArgs = {
            inherit hostname settings;
            inputs = {
              inherit self nixpkgs home-manager charon stylix spicetify-nix;
            };
          };
        };
      })
      hosts);
  };
}
