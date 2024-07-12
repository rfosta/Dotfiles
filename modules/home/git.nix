{ pkgs, ... }: 
{
  programs.git = {
    # Distributed version control system

    enable = true;
    
    # Sets global username and email
    userName = "Ryan Foster";
    userEmail = "rfosta95@gmail.com";
    
    extraConfig = { 
      init.defaultBranch = "main"; # Make default branch 'main'
    };
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ]; Will most likely use these tools later, but for now want to use Git raw!
}
