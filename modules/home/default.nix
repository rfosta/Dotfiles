{...}: {
  imports = [
    # CLI tools
    ./bat.nix
    ./git.nix
    ./neovim.nix
    ./helix.nix
    ./eza.nix
    ./ripgrep.nix
    ./fd.nix

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

	  services.hyprpaper = {
    	enable = true;
   		settings = {
      	splash = false;
      	preload = [ "~/Pictures/Wallpapers/wall.jpg" ];
      	wallpaper = [ "eDP-1,~/Pictures/Wallpapers/wall.jpg" ];
    	};
		};
}
