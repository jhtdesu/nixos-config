{ pkgs, ... }: {
  home.packages = with pkgs; [
    xwayland-satellite # For X11 apps like Discord/Steam
    fuzzel             # Your chosen launcher
    swaybg             # For wallpapers
    waybar             # Status bar
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      window = { opacity = 0.9; padding = { x = 10; y = 10; }; };
      font = {
        size = 11;
        normal.family = "JetBrainsMono Nerd Font";
        bold.family = "JetBrainsMono Nerd Font";
      };
    };
  };
}
