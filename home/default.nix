{ config, pkgs, ... }: {
  home.username = "yukii";
  home.homeDirectory = "/home/yukii";
  home.stateVersion = "24.11"; 

  imports = [
    ./apps.nix
    ./git.nix
    ./desktop.nix
    ./shell.nix # Your previously created shell module
  ];

  programs.home-manager.enable = true;

  programs.nh = {
    enable = true;
    flake = "/home/yukii/nixos-config"; 
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
}
