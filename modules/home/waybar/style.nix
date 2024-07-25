{...}: {
  programs.waybar.style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;

      * {
        border: none;
        border-radius: 10px;
        font-family: monospace;
        font-family: JetBrains Mono Nerd Font;
        font-weight: Bold;
        font-size: 12px;
        min-height: 0;
        padding: 2px;
      }

    window#waybar {
      background: transparent;
      color: #cdd6f4;
    }

    tooltip {
      background: #1e1e2e;
      border-radius: 10px;
      border-width: 2px;
      border-style: solid;
      border-color: #11111b;
    }

    #workspaces button {
      padding: 5px;
      color: #313244;
      margin-right: 5px;
    }

    #workspaces button.active {
      /* color: #a6adc8; */
      color: @text;
    }

    #workspaces button.focused {
      color: #a6adc8;
      background: #eba0ac;
      border-radius: 10px;
    }

    #workspaces button.urgent {
      color: #11111b;
      background: #a6e3a1;
      border-radius: 10px;
    }

    #workspaces button:hover {
      background: #11111b;
      color: #cdd6f4;
      border-radius: 0;
      border: 0;
      outline: 0;
    }

    #clock, #battery, #pulseaudio, #network, #workspaces, #tray, #backlight {
      background: #1e1e2e;
      padding: 0px 10px;
      margin: 3px 0px;
    }

    #tray {
      border-radius: 10px;
      margin-right: 4px;
    }

    #workspaces {
      background: #1e1e2e;
      border-radius: 10px;
      padding-right: 0px;
      padding-left: 5px;
      margin-left: 5px;
    }

    #clock {
      color: #f9e2af;
      border-radius: 10px;
    }

    #network {
      color: #fab387;
      border-radius: 10px;
      padding-right: 12px;
    }

    #pulseaudio {
      color: #89b4fa;
    }

    #battery{
      color:  #a6e3a1;
    }

    #backlight{
      color: #cba6f7;
    }
  '';
}
