{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        margin-top = 10;
        margin-left = 16;
        margin-right = 16;
        spacing = 0;
        modules-left = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "battery" "tray" ];
        "niri/workspaces" = {
          format = "{name}";
          all-outputs = true;
        };
        "niri/window" = {
          format = "{}";
          separate-outputs = true;
          max-length = 50;
        };
        "clock" = {
          format = "  {:%H:%M  󰃭  %a, %b %d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };
        "tray" = {
          spacing = 8;
        };
      };
    };
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 12px;
        min-height: 0;
      }
      window#waybar {
        background: transparent;
      }
      .modules-left,
      .modules-center,
      .modules-right {
        background-color: rgba(26, 27, 38, 0.90);
        border-radius: 24px;
        padding: 0 8px;
        border: 1px solid rgba(122, 162, 247, 0.25);
      }
      #workspaces button {
        padding: 0 7px;
        color: #565f89;
        background: transparent;
        border: none;
        border-radius: 16px;
        margin: 4px 2px;
        transition: all 0.2s ease;
      }
      #workspaces button:hover {
        color: #a9b1d6;
        background-color: rgba(122, 162, 247, 0.08);
      }
      #workspaces button.focused,
      #workspaces button.active {
        color: #7aa2f7;
        background-color: rgba(122, 162, 247, 0.18);
      }
      #window {
        color: #a9b1d6;
        padding: 0 8px;
        font-weight: 500;
      }
      #clock {
        color: #c0caf5;
        padding: 0 12px;
        font-weight: bold;
        letter-spacing: 0.3px;
      }
      #battery {
        color: #9ece6a;
        padding: 0 12px;
      }
      #battery.charging {
        color: #73daca;
      }
      #battery.warning {
        color: #e0af68;
      }
      #battery.critical {
        color: #f7768e;
        animation: blink 1s linear infinite;
      }
      @keyframes blink {
        to { opacity: 0.5; }
      }
      #tray {
        padding: 0 8px;
      }
      #tray > .passive {
        -gtk-icon-effect: dim;
      }
      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
      }
    '';
  };
}
