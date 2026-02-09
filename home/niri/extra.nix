{ pkgs, ... }: {
  # Notification Daemon
  services.mako = {
  enable = true;
    settings = {
      background-color = "#1a1b26";
      border-color = "#7aa2f7";
      border-radius = 8;
    };
  };

  services.swayidle = {
      enable = true;
      timeouts = [
        # After 5 minutes, lock the screen
        { timeout = 300; command = "${pkgs.swaylock}/bin/swaylock -f -c 000000"; }
      
        # After 10 minutes, turn off the displays
        { 
          timeout = 600; 
          command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
          resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
        }
      ];
      # Lock the screen before the system goes to sleep
      events = [
        { event = "before-sleep"; command = "${pkgs.swaylock}/bin/swaylock -f -c 000000"; }
      ];
    };
 

  # Auto-mount USB drives
  services.udiskie.enable = true;

  # Screen locker
  programs.swaylock.enable = true;
}
