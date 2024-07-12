{pkgs, ...}: {
  # Vim text editor fork focused on extensibility and agility
  programs.neovim = {
    enable = true;

    # Sets $EDITOR and aliases og vim commands
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      # Treesiter
      gcc
      gnumake
    ];
  };

  # Symlink nvim folder to correct spot. Prefer lua to keep config agnostic, and I want to understand the basic of lua and vim first
  xdg.configFile.nvim = {
    source = ./nvim;
    recursive = true;
  };
}
