{...}: {
  imports = [
    # CLI tools
    ./bat.nix
    ./git.nix
    ./neovim.nix
    ./helix.nix
    ./eza.nix
		./ripgrep.nix

    # Desktop
    ./firefox.nix
    ./waybar
    ./wofi

    # Misc
    ./packages.nix
    
    # Shell
    ./kitty.nix
    ./fish.nix
  ];
}
