{pkgs, ...}:
let
  # Down Catppuccin theme from source (Github)...
  catppuccin-fish = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "fish";
    rev = "0ce27b518e8ead555dec34dd8be3df5bd75cff8e";
    hash = "sha256-Dc/zdxfzAUM5NX8PxzfljRbYvO9f9syuLO8yBr+R3qg=";
  };
in
{
  # Then symlink that to the correct location for fish to pick it up. Not sure if this is the best way to do this, but it works.
  xdg.configFile."fish/themes/Catppuccin Mocha.theme".source = "${catppuccin-fish}/themes/Catppuccin Mocha.theme";

  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
      set -U fish_greeting # Removes fish default greeting

      fish_config theme choose "Catppuccin Mocha" # Sets that theme to Catppuccin (Mocha)

      # Use fish when using 'nix shell' because bash is old and miserable
      ${pkgs.nix-your-shell}/bin/nix-your-shell fish | source
    '';

    plugins = with pkgs; [
      { name = "Pure"; src = fishPlugins.pure.src; } # Pretty, minimal, and fast prompt for Fish shell inspired by sindresorhus/pure 
      { name = "Sponge"; src = fishPlugins.sponge.src; } # 🧽 Clean fish history from typos automatically 
      { name = "Pisces"; src = fishPlugins.pisces.src; } # ♓️ Fish shell plugin that helps you to work with paired symbols in the command line 
    ];

    shellAliases = {
      c = "clear";
    };
 };
}
