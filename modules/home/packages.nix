{pkgs, ...}: {
  home.packages = with pkgs; [
    # vesktop
		hyprpaper

    # CLI tools
    nitch
    fzf

    # Work
    google-chrome
  ];
}
