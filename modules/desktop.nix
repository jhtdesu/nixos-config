{ pkgs, ... }: {
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}
