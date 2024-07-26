{ pkgs, ...}:
{
  # Cross-platform, fast, feature-rich, GPU based terminal 
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;

    theme = "Rosé Pine";

    font = {
      name = "JetBrainsMono Nerd Font"; # Ligatures ftw!
      size = 11;
    };
    
    settings = {
      shell = "fish";
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      window_padding_width = 10;
    };
  };
}
