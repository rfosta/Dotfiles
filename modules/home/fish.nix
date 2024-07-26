{pkgs, ...}:
let
  # Pull down Rose Pine theme from source (Github)...
  rose-pine-fish = pkgs.fetchFromGitHub {
    owner = "rose-pine";
    repo = "fish";
    rev = "38aab5baabefea1bc7e560ba3fbdb53cb91a6186";
    hash = "sha256-bSGGksL/jBNqVV0cHZ8eJ03/8j3HfD9HXpDa8G/Cmi8=";
  };
in
{
  # Then symlink that to the correct location for fish to pick it up. Not sure if this is the best way to do this, but it works.
  xdg.configFile."fish/themes/Rosé Pine.theme".source = "${rose-pine-fish}/themes/Rosé Pine.theme";

  programs.fish = {
    enable = true;
    
    interactiveShellInit = ''
      set -U fish_greeting # Removes fish default greeting

      fish_config theme choose "Rosé Pine" # Sets that theme to Rose Pine

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
