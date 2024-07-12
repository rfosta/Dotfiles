{
  inputs,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./bootloader.nix
    ./network.nix
    ./sound.nix
    ./system.nix
    ./user.nix
    ./wayland.nix # Will most likely move this to home-manager. (Just to lazy to do it now)
    ./fonts.nix
  ];
}
