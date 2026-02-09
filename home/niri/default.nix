{ pkgs, config, ... }: {
  imports = [
    ./extra.nix
  ];
  fonts.fontconfig.enable = true;
  home.packages = [
    pkgs.swaylock
    pkgs.swaybg
    pkgs.nerd-fonts.jetbrains-mono # Use the new specific syntax
  ];
  
  programs.waybar = {
    enable = true;
  };
  programs.niri = {
    enable = true;
    settings = {
      # WAYBAR
      spawn-at-startup = [
	{ command = [ "swaybg" "-m" "fill" "-i" "/home/yukii/nixos-config/wallpapers/anime-eyes-illustration.jpg" ]; }
	{ command = ["waybar"]; } 
      ];
      # INPUT SETTINGS
      input = {
        keyboard.xkb.layout = "us";
        touchpad = {
          tap = true;
          dwt = true; # disable-while-typing
          natural-scroll = true;
        };
        mouse.accel-speed = 0.2;
      };
      # LAYOUT & APPEARANCE
      layout = {
        gaps = 12;
        center-focused-column = "never";
        preset-column-widths = [
          { proportion = 1.0 / 3.0; }
          { proportion = 1.0 / 2.0; }
          { proportion = 2.0 / 3.0; }
        ];
        default-column-width = { proportion = 1.0 / 2.0; };
        
        focus-ring = {
          enable = true;
          width = 2.0;
          active.color = "#7aa2f7"; # TokyoNight Blue (change to your taste)
          inactive.color = "#414868";
        };
      };

      # 3. KEYBINDINGS
      # Format: "Modifiers+Key".action.name = [ "args" ] or { };
      binds = {
        # Basics
        "Mod+Return".action.spawn = [ "alacritty" ];
        "Mod+D".action.spawn = [ "fuzzel" ];
        "Mod+Q".action.close-window = { };
        "Mod+Shift+E".action.quit = { };

        # Navigation (Focus)
        "Mod+Left".action.focus-column-left = { };
        "Mod+Right".action.focus-column-right = { };
        "Mod+Up".action.focus-window-or-monitor-up = { };
        "Mod+Down".action.focus-window-or-monitor-down = { };

        # Window Movement (Move windows)
        "Mod+Shift+Left".action.move-column-left = { };
        "Mod+Shift+Right".action.move-column-right = { };

        # Column Management
        "Mod+Comma".action.consume-window-into-column = { };
        "Mod+Period".action.expel-window-from-column = { };
        "Mod+R".action.switch-preset-column-width = { };
        "Mod+F".action.maximize-column = { };

        # Workspace Navigation
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;

        # Screenshots (requires grim/slurp)
        "Print".action.screenshot = { };
        "Mod+Print".action.screenshot-screen = { };
	"Mod+L".action.spawn = [ "swaylock" "-c" "000000" ];
      };

      # 4. WINDOW RULES
      window-rules = [
        {
          geometry-corner-radius = {
            bottom-left = 12.0;
            bottom-right = 12.0;
            top-left = 12.0;
            top-right = 12.0;
          };
	  clip-to-geometry = true;
	}
        {
          matches = [{ app-id = "brave"; }];
          open-on-workspace = "browser";
        }
        {
          matches = [{ is-active = false; }];
          opacity = 0.95;
        }
      ];
    };
  };
}
