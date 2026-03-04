{ config, pkgs, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ../../modules/system.nix
    ../../modules/desktop.nix
    ../../modules/dev-tools.nix
  ];

  networking.hostName = "jhtdesu";
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;
  services.displayManager.sessionPackages = [ inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable ];

  users.users.yukii = {
    isNormalUser = true;
    description = "Yukii";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };

  environment.pathsToLink = [ 
    "/share/applications" 
    "/share/xdg-desktop-portal" 
    "/share/niri"
  ];

  programs.fish.enable = true;
  security.pam.services.swaylock = {};
  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    neovim git brave wget curl 
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  system.stateVersion = "25.11"; 
}
