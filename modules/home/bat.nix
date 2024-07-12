{
  pkgs,
  inputs,
  ...
}: {
  programs.bat = {
    # A cat(1) clone with syntax highlighting and Git integration

    enable = true;
    config = {
      pager = "less -FR"; # Passing specific options to pager, instead of defaults
      theme = "catppuccin-mocha";
    };

    themes = {
      catppuccin-mocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "d714cc1d358ea51bfc02550dabab693f70cccea0";
          sha256 = "sha256-Q5B4NDrfCIK3UAMs94vdXnR42k4AXCqZz6sRn8bzmf4=";
        };

        file = "themes/Catppuccin Mocha.tmTheme";
      };
    };
  };
  
  # Set the alias here, so if I decide to remove or stop using it, the alias will be removed. Want to make this a module, and configurable in the future.
  programs.fish.shellAliases = { cat = "bat"; };
}
