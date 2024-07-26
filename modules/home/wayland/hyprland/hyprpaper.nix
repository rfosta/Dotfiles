{...}: {
  services.hyprpaper = {
    enable = true;

    settings = {
      # ipc = "on";
      splash = false;

      preload = ["~/Pictures/Wallpapers/wall.jpg"];

      wallpaper = [",~/Pictures/Wallpapers/wall.jpg"];
    };
  };
}
