{ inputs, pkgs, ...}:
{
  home.packages = with pkgs; [
    vesktop

    # CLI tools
    nitch
    fzf

    # Work
    google-chrome
  ]; 
}
