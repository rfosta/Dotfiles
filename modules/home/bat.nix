{pkgs, ...}: {
  programs.bat = {
    # A cat(1) clone with syntax highlighting and Git integration

    enable = true;
    config = {
      pager = "less -FR"; # Passing specific options to pager, instead of defaults
      theme = "rose-pine";
    };

    themes = {
      rose-pine = {
        src = pkgs.fetchFromGitHub {
          owner = "rose-pine";
          repo = "tm-theme";
          rev = "c4235f9a65fd180ac0f5e4396e3a86e21a0884ec";
          sha256 = "sha256-jji8WOKDkzAq8K+uSZAziMULI8Kh7e96cBRimGvIYKY=";
        };

        file = "dist/themes/rose-pine.tmTheme";
      };
    };
  };

  # Set the alias here, so if I decide to remove or stop using it, the alias will be removed. Want to make this a module, and configurable in the future.
  programs.fish.shellAliases = {cat = "bat";};
}
