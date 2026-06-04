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
      url = "github:0xc000022070/zen-browser-flake/beta";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-server.url = "github:nix-community/nixos-vscode-server";

    lsfg-vk-flake = {
      url = "github:pabloaul/lsfg-vk-flake/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    frc-nix.url = "github:frc4451/frc-nix";

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    headlamp.url = "github:jpowersdev/headlamp-nix";

    claude-code = {
      url = "github:sadjow/claude-code-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fast-nix-gc.url = "github:Mic92/fast-nix-gc";
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      vscode-server,
      lsfg-vk-flake,
      frc-nix,
      antigravity-nix,
      claude-code,
      headlamp,
      fast-nix-gc,
      ...
    }:
    {
      nixosConfigurations = {
        theseus = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            inputs.nixos-hardware.nixosModules.framework-16-7040-amd
            vscode-server.nixosModules.default
            lsfg-vk-flake.nixosModules.default
            fast-nix-gc.nixosModules.default
            (
              { ... }:
              {
                nixpkgs.overlays = [
                  frc-nix.overlays.default
                  antigravity-nix.overlays.default
                  headlamp.overlays.default
                  claude-code.overlays.default
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
