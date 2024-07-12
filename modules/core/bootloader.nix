{pkgs, ...}: {
  # Prefer systemd over GRUB, so left the default. Just set the limit of generations 7 and using the latest kernel.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 7; # Keeps the bootscreen from looking like that spongebob list meme
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
