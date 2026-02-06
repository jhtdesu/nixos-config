{ config, pkgs, ... }: {
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

  users.users.yukii = {
    isNormalUser = true;
    description = "Yukii";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    neovim git brave wget curl niri
  ];

  system.stateVersion = "25.11"; 
}
