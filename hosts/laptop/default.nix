{ config, lib, pkgs, ... }:
{
  # Modularize the config, and import that below:
  
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      # Providing disko the disk layout
      ./disk-config.nix

      # Load the systems core modules. (home-manager included)
      ./../../modules/core
    ];
  
  # Enable the OpenSSH daemon. (Will most likely move this somewhere in the future)
  services.openssh.enable = true;
  services.openssh.openFirewall = true;

  # Prefer TLP over other tools, but simple way to help with battery life on latptop
  services.tlp = {
    enable = true;
  };
    
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}
