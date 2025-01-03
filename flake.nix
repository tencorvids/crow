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
    textfox.url = "github:adriankarlen/textfox";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      charon,
      stylix,
      spicetify-nix,
      textfox,
      ...
    }:
    let
      getHosts =
        dir:
        let
          entries = builtins.readDir dir;
        in
        builtins.filter (name: entries.${name} == "directory") (builtins.attrNames entries);

      hosts = getHosts ./hosts;

      pkgsForSystem =
        system:
        import nixpkgs {
          inherit system;
          overlays = [
            charon.overlay
          ];
          config = {
            allowUnfree = true;
          };
        };
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (
          hostname:
          let
            hostDir = ./hosts/${hostname};
            settings = import "${hostDir}/settings.nix";
            system = settings.system;
          in
          {
            name = hostname;
            value = nixpkgs.lib.nixosSystem {
              inherit system;
              modules = [ "${hostDir}/configuration.nix" ];
              pkgs = pkgsForSystem system;
              specialArgs = {
                inherit hostname settings;
                pkgs = pkgsForSystem system;
                inputs = {
                  inherit
                    self
                    nixpkgs
                    home-manager
                    charon
                    stylix
                    spicetify-nix
                    textfox
                    ;
                };
              };
            };
          }
        ) hosts
      );
    };
}
