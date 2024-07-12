{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];

      trusted-users = ["ryan"];

      substituters = [
        "https://cache.nixos.org"
        "https://helix.cachix.org"
      ];

      trusted-public-keys = [
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 5d";
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
		wl-clipboard
  ];

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "23.11";
}
