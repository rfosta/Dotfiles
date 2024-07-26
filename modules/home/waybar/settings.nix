{...}: {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        position = "top";
        layer = "top";
        spacing = 4;

        modules-center = [];
        modules-right = [
          "pulseaudio"
          "network"
          "power-profiles-daemon"
          "battery"
          "clock"
          "tray"
        ];
        modules-left = [
          "hyprland/workspaces"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          warp-on-scroll = false;
          format = "{icon}";
          persistent_workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
          };
          format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };

        "tray" = {
          spacing = 10;
        };
        "clock" = {
          format = "{:%I:%M %p}";
          format-alt = "{:%B %d, %Y}";
        };
        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon} ";
          format-full = "{capacity}% {icon} ";
          format-charging = "{capacity}%   ";
          format-plugged = "{capacity}%  ";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };
        "network" = {
          # "interface": "wlp2*", // (Optional) To force the use of this interface
          format-wifi = " ";
          format-ethernet = "{ipaddr}/{cidr}  ";
          tooltip-format = "{essid} ({signalStrength}%) ";
          format-linked = "{ifname} (No IP)  ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "({signalStrength}%)";
        };
        "pulseaudio" = {
          # "scroll-step": 1, // %, can be a float
          format = "{volume}% {icon} ";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " ";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pulsemixer --toggle-mute";
        };
      };
    };
  };
}
