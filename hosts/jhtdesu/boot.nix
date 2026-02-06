{ pkgs, ... }: {
  boot = {
    loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    initrd.systemd.enable = true;
    kernelParams = [ "8250.nr_uarts=0" ];
  };

  environment.systemPackages = [ 
    pkgs.grub2 # This provides grub-reboot, grub-set-default, etc.
  ];
}
