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

  # Auto-mount USB drives
  services.udiskie.enable = true;

  # Screen locker
  programs.swaylock.enable = true;
}
