{...}: {
  # A modern, maintained replacement for ls 
  programs.eza = {
    enable = true;

    enableFishIntegration = true; # Sets aliases for ls -> eza
  };
}
