{ pkgs, ... }: {

  # Notification Daemon
  services.mako = {
    enable = true;
    settings = {
      background-color = "#1a1b26";
      border-color = "#7aa2f7";
      border-radius = 8;
      default-timeout = 5000; # 5 seconds
      text-color = "#c0caf5";
      border-size = 2;
      width = 300;
      height = 100;
      padding = "12";
      font = "JetBrainsMono Nerd Font 11";
      "[app-name='Wayland Diagnose']" = {
        invisible = 1;
      };
    };
  };

  home.pointerCursor = {
    name = "Banana";
    package = pkgs.banana-cursor;
    size = 24;
    gtk.enable = true;
  };
  
  # Auto-mount USB drives
  services.udiskie.enable = true;

  # Screen locker
  programs.swaylock.enable = true;
}
