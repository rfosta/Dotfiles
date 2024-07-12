{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    extraSpecialArgs = {inherit inputs;};
    users.ryan = {
      imports = [./../home];

      home.username = "ryan";
      home.homeDirectory = "/home/ryan";

      home.stateVersion = "24.05";

      programs.home-manager.enable = true;

      xdg.userDirs = {
        enable = true;
        createDirectories = true;
      };
    };
  };

  users.users.ryan = {
    isNormalUser = true;
    description = "Ryan";
    extraGroups = ["networkmanager" "wheel"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDiRppGqUaCmLyOqpyonNGBEOgOFzCawSoNrpGEqMDAD ryan@laptop"
    ];
  };

  nix.settings.allowed-users = ["ryan"];
}
