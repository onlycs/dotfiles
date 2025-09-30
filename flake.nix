{
  description = "Nixy Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        theseus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            inputs.nixos-hardware.nixosModules.framework-16-7040-amd
            (
              { pkgs, ... }:
              {
                nixpkgs.overlays = [
                  (import ./overlays)
                  (final: prev: {
                    # Create a fixed app2unit
                    app2unit-fixed = prev.app2unit.overrideAttrs (oldAttrs: {
                      nativeBuildInputs = (oldAttrs.nativeBuildInputs or [ ]) ++ [ final.scdoc ];
                    });

                    # Create fixed caelestia-shell packages
                    caelestia-shell-packages = inputs.caelestia-shell.packages.${prev.system} // {
                      with-cli = inputs.caelestia-shell.packages.${prev.system}.with-cli.override {
                        # Use the fixed app2unit by overriding the callPackage call
                        app2unit = final.callPackage (inputs.caelestia-shell + "/nix/app2unit.nix") {
                          pkgs = final.extend (_: _: { app2unit = final.app2unit-fixed; });
                        };
                      };
                    };

                    # Create with-cli using the fixed caelestia-shell
                    caelestia-shell-with-cli = final.caelestia-shell-packages.with-cli;
                  })
                ];
              }
            )
            ./hosts/theseus/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.angad = import ./home/angad/home.nix;
            }
          ];
        };
      };
    };
}
