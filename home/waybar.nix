{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 34;
        spacing = 4;
        
        modules-left = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "pulseaudio" "network" "battery" "tray" ];

        "niri/workspaces" = {
          format = "{name}";
          all-outputs = true;
        };

        "niri/window" = {
          format = "{}";
          separate-outputs = true;
        };

        "clock" = {
          format = "{:%H:%M | %a %d %b}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };

        "cpu" = {
          format = "  {usage}%";
        };

        "memory" = {
          format = "  {}%";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };

        "network" = {
          format-wifi = "  {essid}";
          format-ethernet = "󰈀  {ipaddr}/{cidr}";
          format-disconnected = "󰖪";
        };
      };
    };
    
    # Simple CSS Styling
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        border-radius: 0;
      }
      window#waybar {
        background-color: rgba(26, 27, 38, 0.8);
        color: #c0caf5;
        border-bottom: 2px solid #7aa2f7;
      }
      #workspaces button {
        padding: 0 5px;
        color: #565f89;
      }
      #workspaces button.focused {
        color: #7aa2f7;
        background-color: rgba(122, 162, 247, 0.1);
      }
      #window {
        margin-left: 10px;
        font-weight: bold;
      }
    '';
  };
}
