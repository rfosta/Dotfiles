{ inputs, pkgs, ...}:
{
  home.packages = with pkgs; [
    vesktop

    # CLI tools
    nitch
    ripgrep
    fzf

    # Work
    google-chrome
  ]; 
}
