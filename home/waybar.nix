{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "battery" "tray" ];

        "niri/workspaces" = {
           format = "{index}";
        };

        "clock" = {
          format = "{:%H:%M | %a %d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "cpu" = { format = "CPU: {usage}%"; };
        "memory" = { format = "RAM: {}%"; };
        "battery" = {
          format = "{capacity}% {icon}";
          format-icons = ["" "" "" "" ""];
        };
      };
    };
    
    # Minimalist styling to match your Alacritty opacity
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
      }
      window#waybar {
        background: rgba(40, 40, 40, 0.9);
        color: #ffffff;
      }
      #workspaces button {
        padding: 0 5px;
        color: #ffffff;
      }
      #workspaces button.focused {
        border-bottom: 3px solid #ffffff;
      }
    '';
  };
}
